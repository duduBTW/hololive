import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hololive/components/generics/Loading.dart';
import 'package:hololive/model/ResultItem.dart';
import 'package:hololive/model/Talents.dart';
import 'package:hololive/providers/talent/talent.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert' as convert;
import 'dart:math' as math;

import '../../components/Talents/TalentHeader.dart';

import '../GenericListItem.dart';

class PaginatedTalent extends StatefulWidget {
  final Talents talent;
  final Function launchURL;
  final Function openFilters;

  const PaginatedTalent({
    // 2
    Key key,
    this.talent,
    this.launchURL,
    this.openFilters,
  }) : super(key: key);

  @override
  _PaginatedTalentState createState() => _PaginatedTalentState();
}

class _PaginatedTalentState extends State<PaginatedTalent>
    with TickerProviderStateMixin {
  AnimationController animationController;

  bool collapsed = true;
  final microsecondsAn = 250;

  @override
  void initState() {
    // Provider.of(context, listen: false).pagingController.;
    animationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: microsecondsAn),
    );
    super.initState();
  }

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

  getHeader() {
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
                          maxHeight: MediaQuery.of(context).size.height * 0.4),
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
      SliverToBoxAdapter(
          child: Container(
        height: 70.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 1,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(15),
              child: OutlinedButton.icon(
                style: ButtonStyle(
                  side: MaterialStateProperty.resolveWith((states) {
                    Color _borderColor;

                    if (states.contains(MaterialState.disabled)) {
                      _borderColor = Colors.grey;
                    } else if (states.contains(MaterialState.pressed)) {
                      _borderColor = Colors.white;
                    } else {
                      _borderColor = Colors.white;
                    }

                    return BorderSide(color: _borderColor, width: 1);
                  }),
                ),
                onPressed: () => widget.openFilters(context),
                icon: Icon(
                  Icons.expand_more,
                  color: Colors.white,
                ),
                label: Text(
                  "Filters",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ),
      )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<TalentController>(context);

    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return getHeader();
      },
      body: RefreshIndicator(
        onRefresh: () => Future.sync(
          () {
            setState(() {
              controller.nextPageToken = "";
            });
            controller.pagingController.refresh();
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
            firstPageProgressIndicatorBuilder: (context) => LoadingHololive(),
          ),
          // 4
          pagingController: controller.pagingController,
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
    // Provider.of<TalentController>(context, listen: false)
    // .pagingController
    // .dispose();
    super.dispose();
  }
}
