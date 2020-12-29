import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hololive/model/ResultItem.dart';
import 'package:hololive/model/Talents.dart';
import 'package:hololive/providers/talent/talent.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert' as convert;
import 'dart:math' as math;

import '../../model/YoutubeModel.dart';
import '../../components/Talents/TalentHeader.dart';

import '../GenericListItem.dart';

class PaginatedTalent extends StatefulWidget {
  final Talents talent;
  final Function launchURL;

  const PaginatedTalent({
    // 2
    Key key,
    this.talent,
    this.launchURL,
  }) : super(key: key);

  @override
  _PaginatedTalentState createState() => _PaginatedTalentState();
}

class _PaginatedTalentState extends State<PaginatedTalent>
    with TickerProviderStateMixin {
  AnimationController animationController;
  // final _pagingController = PagingController<int, ReusltItem>(
  //   firstPageKey: 1,
  // );
  String nextPageToken = "";
  bool collapsed = true;
  final microsecondsAn = 250;

  @override
  void initState() {
    Provider.of<TalentController>(context, listen: false)
        .pagingController
        .addPageRequestListener((pageKey) {
      Provider.of<TalentController>(context, listen: false).fetchPage(pageKey);
    });

    animationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: microsecondsAn),
    );
    super.initState();
  }

  // Future<void> _fetchPage(int pageKey) async {
  //   try {
  //     var response = await http.get(
  //         "http://localhost:5000/youtube?token=7f6ca27a-fce1-4da5-a8e8-def2e01b6da2&previusOldest=$nextPageToken&page=${pageKey - 1}");

  //     var jsonString = convert.utf8.decode(response.bodyBytes);

  //     var newPage = List<ReusltItem>.from(convert.json
  //         .decode(jsonString)['result']
  //         .map((x) => ReusltItem.fromJson(x)));

  //     setState(() {
  //       nextPageToken = convert.json.decode(jsonString)['oldest'];
  //     });

  //     final previouslyFetchedItemsCount =
  //         // 2
  //         _pagingController.itemList?.length ?? 0;
  //     final newItems = newPage;

  //     var count = convert.json.decode(jsonString)['count'];

  //     final newItemsCount =
  //         newPage.where((element) => element.type == 1).length;
  //     final totalFetchedItemsCount =
  //         previouslyFetchedItemsCount + newItemsCount;
  //     final isLastPage = totalFetchedItemsCount == count;

  //     if (isLastPage) {
  //       // 3
  //       _pagingController.appendLastPage(newItems);
  //     } else {
  //       final nextPageKey = pageKey + 1;
  //       _pagingController.appendPage(newItems, nextPageKey);
  //     }
  //   } catch (error) {
  //     // 4
  //     _pagingController.error = error;
  //     throw error;
  //   }
  // }

  buildList() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Text(
            "One day, Ina'nis picked up a strange book and then started to gain the power of controlling tentacles. To her, tentacles are just a part in her ordinary life; it has never been a big deal for her.",
            style: TextStyle(
              height: 1.5,
              color: Theme.of(context).primaryColor,
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "However, her girly mind does want to get them dressed up and stay pretty. After gaining power, she started hearing Ancient Whispers and Revelations. Hence, she began her VTuber activities to deliver random sanity checks on humanity, as an ordinary girl.",
            style: TextStyle(
              height: 1.5,
              color: Theme.of(context).primaryColor,
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  "Debut date",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  "Septemb2er 13, 2020",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 12),
                ),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  "Height",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  "157 cm",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 12),
                ),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  "Birthday",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  "May 20th",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 12),
                ),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  "Fanbase name",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  "TentaCultists",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 12),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _pagingController =
        Provider.of<TalentController>(context).pagingController;
    //  CustomScrollView(
    //       slivers: [
    //         // SliverAppBar(),
    //         SliverPersistentHeader(
    //             pinned: false, floating: true, delegate: TalentHeader()),
    //         SliverList(
    //             delegate: SliverChildListDelegate([
    //           PagedListView.separated(
    //             shrinkWrap: true,
    //             physics: NeverScrollableScrollPhysics(),
    //             // primary: false,
    //             // shrinkWrap: true,
    //             builderDelegate: PagedChildBuilderDelegate<Item>(
    //               itemBuilder: (context, itemVid, index) => GenericListItem(
    //                   itemYt: itemVid, launchURL: widget.launchURL),
    //               firstPageErrorIndicatorBuilder: (context) => Container(
    //                 height: 100,
    //                 width: 100,
    //                 child: Text(":( error"),
    //               ),
    //               noItemsFoundIndicatorBuilder: (context) => Container(
    //                 height: 100,
    //                 width: 100,
    //                 child: Text(":("),
    //               ),
    //             ),
    //             // 4
    //             pagingController: _pagingController,
    //             padding: const EdgeInsets.all(16),
    //             separatorBuilder: (context, index) => const SizedBox(
    //               height: 16,
    //             ),
    //           ),
    //         ]))
    //       ],
    //     );
    // 1
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: NetworkingPageHeader(
              talent: widget.talent,
              minExtent: 90.0,
              maxExtent: 240.0,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: AnimatedContainer(
                      curve: Curves.easeInOut,
                      color: widget.talent.color,
                      constraints: collapsed
                          ? BoxConstraints(maxHeight: 0.0)
                          : BoxConstraints(
                              maxHeight:
                                  MediaQuery.of(context).size.height * 0.4),
                      duration: Duration(milliseconds: microsecondsAn),
                      child: SingleChildScrollView(child: buildList()),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Material(
                      color: widget.talent.color,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            collapsed = !collapsed;
                          });

                          if (!collapsed) animationController.forward();
                          if (collapsed) animationController.reverse();
                        },
                        child: Center(
                          child: AnimatedBuilder(
                            animation: animationController,
                            child: Icon(Icons.expand_more, color: Colors.white),
                            builder: (context, _widget) {
                              print(animationController.value);
                              return Transform.rotate(
                                angle: animationController.value * 1 * math.pi,
                                child: _widget,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: ExpandablePanel(
          //     theme: const ExpandableThemeData(
          //       headerAlignment: ExpandablePanelHeaderAlignment.center,
          //       tapBodyToExpand: true,
          //       tapBodyToCollapse: true,
          //       hasIcon: false,
          //     ),
          //     header: Container(
          //       // color: Color(0xFFF07222D),
          //       child: Padding(
          //         padding: const EdgeInsets.all(10.0),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Expanded(
          //               flex: 2,
          //               child: ExpandableIcon(
          //                 theme: const ExpandableThemeData(
          //                   expandIcon: Icons.keyboard_arrow_down,
          //                   collapseIcon: Icons.keyboard_arrow_up,
          //                   iconColor: Colors.white,
          //                   iconSize: 28.0,
          //                   // iconRotationAngle: math.pi / 2,
          //                   iconPadding: EdgeInsets.only(right: 5),
          //                   hasIcon: false,
          //                 ),
          //               ),
          //             ),
          //             Expanded(
          //               flex: 1,
          //               child: Container(),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //     expanded: buildList(),
          //   ),
          // ),
        ];
      },
      body: RefreshIndicator(
        onRefresh: () => Future.sync(
          // 2
          () {
            setState(() {
              nextPageToken = "";
            });
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
    // 4
    Provider.of(context, listen: false).pagingController.dispose();
    super.dispose();
  }
}
