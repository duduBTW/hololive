import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hololive/model/Talents.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../model/YoutubeModel.dart';
import '../components/Talents/TalentHeader.dart';

import '../components/GenericListItem.dart';

class MainScreen extends StatelessWidget {
  void _openFilters(context) =>
      Navigator.of(context).pushNamed('/community/filters');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () => _openFilters(context))
        ],
        centerTitle: true,
        title: Image.network(
          "https://pbs.twimg.com/profile_images/1198438854841094144/y35Fe_Jj.jpg",
          height: 35,
        ),
      ),
      body: Center(child: PaginatedTalent()),
    );
  }
}

class PaginatedTalent extends StatefulWidget {
  final Function launchURL;

  const PaginatedTalent({
    // 2
    Key key,
    this.launchURL,
  }) : super(key: key);

  @override
  _PaginatedTalentState createState() => _PaginatedTalentState();
}

class _PaginatedTalentState extends State<PaginatedTalent>
    with AutomaticKeepAliveClientMixin {
  final _pagingController = PagingController<int, Item>(
    firstPageKey: 1,
  );
  // String nextPageToken = "";

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
      var response = await http.get("http://localhost:5000/youtube/main");

      var jsonString = convert.utf8.decode(response.bodyBytes);

      var newPage = List<Item>.from(
          convert.json.decode(jsonString).map((x) => Item.fromJson(x)));

      // setState(() {
      //   nextPageToken = newPage.nextPageToken;
      // });

      final previouslyFetchedItemsCount =
          // 2
          _pagingController.itemList?.length ?? 0;
      final newItems = newPage;

      // final newItemsCount = newPage.length;
      // final totalFetchedItemsCount =
      // previouslyFetchedItemsCount + newItemsCount;
      // final isLastPage =
      // totalFetchedItemsCount == newPage.pageInfo.totalResults;
      // totalFetchedItemsCount == newPage.pageInfo.totalResults;

      // if (isLastPage) {
      if (true) {
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
  Widget build(BuildContext context) {
    super.build(context);

    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[];
      },
      body: RefreshIndicator(
        onRefresh: () => Future.sync(
          // 2
          () {
            _pagingController.refresh();
          },
        ),
        child: PagedListView.separated(
          // primary: false,
          // shrinkWrap: true,
          builderDelegate: PagedChildBuilderDelegate<Item>(
            itemBuilder: (context, itemVid, index) =>
                // GenericListItem(itemYt: itemVid, launchURL: widget.launchURL),
                Container(
              child: Text("Teste"),
            ),
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
          padding: const EdgeInsets.symmetric(vertical: 16),
          separatorBuilder: (context, index) => const SizedBox(
            height: 16,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
