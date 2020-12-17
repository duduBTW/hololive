import 'package:flutter/material.dart';
import 'package:hololive/model/YoutubeModel.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../GenericListItem.dart';

class PaginatedTalent extends StatefulWidget {
  final String channelId;
  final Function launchURL;

  const PaginatedTalent({
    // 2
    Key key,
    this.channelId,
    this.launchURL,
  }) : super(key: key);

  @override
  _PaginatedTalentState createState() => _PaginatedTalentState();
}

class _PaginatedTalentState extends State<PaginatedTalent> {
  final _pagingController = PagingController<int, Item>(
    firstPageKey: 1,
  );
  String nextPageToken = "";

  @override
  void initState() {
    // 3
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      var response = await http.get(
          "http://5cb8ab40f6f7.ngrok.io/youtube?channelId=${widget.channelId}&pageToken=$nextPageToken");

      var jsonString = convert.utf8.decode(response.bodyBytes);

      var newPage = youtubeModelFromJson(jsonString);

      setState(() {
        nextPageToken = newPage.nextPageToken;
      });

      final previouslyFetchedItemsCount =
          // 2
          _pagingController.itemList?.length ?? 0;
      final newItems = newPage.items;

      final newItemsCount = newPage.items.length;
      final totalFetchedItemsCount =
          previouslyFetchedItemsCount + newItemsCount;
      final isLastPage =
          totalFetchedItemsCount == newPage.pageInfo.totalResults;
      // totalFetchedItemsCount == newPage.pageInfo.totalResults;

      if (isLastPage) {
        // 3
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      // 4
      _pagingController.error = error;
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) =>
      // 1
      // RefreshIndicator(
      //   onRefresh: () => Future.sync(
      //     // 2
      //     () => _pagingController.refresh(),
      //   ),
      // 3
      // child:
      NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                      Theme.of(context).accentColor,
                      Theme.of(context).primaryColor,
                    ])),
                height: 100,
                child: Text(
                  "Escolha uma empresa",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                alignment: Alignment(0.0, 0.0),
              ),
            ]))
          ];
        },
        body: RefreshIndicator(
          onRefresh: () => Future.sync(
            // 2
            () => _pagingController.refresh(),
          ),
          child: PagedListView.separated(
            // primary: false,
            // shrinkWrap: true,
            builderDelegate: PagedChildBuilderDelegate<Item>(
              itemBuilder: (context, itemVid, index) =>
                  GenericListItem(itemYt: itemVid, launchURL: widget.launchURL),
              firstPageErrorIndicatorBuilder: (context) => Container(
                height: 100,
                width: 100,
                child: Text(":( error"),
              ),
              noItemsFoundIndicatorBuilder: (context) => Container(
                height: 100,
                width: 100,
                child: Text(":("),
              ),
            ),
            // 4
            pagingController: _pagingController,
            padding: const EdgeInsets.all(16),
            separatorBuilder: (context, index) => const SizedBox(
              height: 16,
            ),
          ),
        ),
        // ),
      );

  @override
  void dispose() {
    // 4
    _pagingController.dispose();
    super.dispose();
  }
}
