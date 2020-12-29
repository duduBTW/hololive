import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hololive/model/ResultItem.dart';
import 'package:hololive/model/Talents.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert' as convert;

import '../../model/YoutubeModel.dart';
import '../../components/Talents/TalentHeader.dart';

import '../../components/GenericListItem.dart';

class CommynityScreen extends StatelessWidget {
  void _openFilters(context) =>
      Navigator.of(context).pushNamed('/community/filters');

  _launchURL(ReusltItem item) async {
    // if (Platform.isIOS) {
    //   if (await canLaunch('youtube://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw')) {
    //     await launch('youtube://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw', forceSafariVC: false);
    //   } else {
    //     if (await canLaunch('https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw')) {
    //       await launch('https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw');
    //     } else {
    //       throw 'Could not launch https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw';
    //     }
    //   }
    // } else {
    String url;

    print('---------------');
    print(item);

    // switch (item.type) {
    //   case 1:
    //     url = 'https://www.youtube.com/watch?v=${item.id}';
    //     break;
    //   case 1:
    //     url = 'https://www.reddit.com/r/Hololive/comments/${item.id}';

    //     break;
    //   default:
    // }

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Community"),
        actions: [
          IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () => _openFilters(context))
        ],
      ),
      body: PaginatedTalent(launchURL: _launchURL),
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
  final _pagingController = PagingController<int, ReusltItem>(
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
      var response = await http.get("http://localhost:5000/community");

      var jsonString = convert.utf8.decode(response.bodyBytes);

      var newPage = List<ReusltItem>.from(
          convert.json.decode(jsonString).map((x) => ReusltItem.fromJson(x)));

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
          builderDelegate: PagedChildBuilderDelegate<ReusltItem>(
            itemBuilder: (context, itemVid, index) =>
                GenericListItem(item: itemVid, launchURL: widget.launchURL),
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
