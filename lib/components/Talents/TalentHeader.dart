import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hololive/model/Talents.dart';

class NetworkingPageHeader implements SliverPersistentHeaderDelegate {
  NetworkingPageHeader({
    this.talent,
    this.minExtent,
    @required this.maxExtent,
  });
  final Talents talent;
  final double minExtent;
  final double maxExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    print(shrinkOffset);
    return Container(
        child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: double.infinity,
            padding: EdgeInsets.only(bottom: 10),
            color: talent.color,
            alignment: Alignment.bottomCenter,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            color: talent.color,
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    // color: Colors.blue,
                    height: max(0, (120 - shrinkOffset)),
                    width: 120,
                    // color: widget.talent.color,
                    child: Hero(
                      tag: talent.name,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(talent.image),
                          fit: BoxFit.cover,
                        )),
                        height: 130,
                        width: 130,
                        // child: Image.network(
                        //   ,
                        //   fit: BoxFit.fitWidth,
                        // ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    talent.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Holo EN",
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 10,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (shrinkOffset < 120)
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              // color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 45,
                  ),
                  Container(
                    child: Text(
                      "Youtube",
                      style: TextStyle(
                          color: Colors.white, letterSpacing: 1, fontSize: 10),
                    ),
                    color: Color(0xff4E0000),
                    width: double.infinity,
                    margin: EdgeInsets.only(right: 10, bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  Container(
                    child: Text(
                      "Twitter",
                      style: TextStyle(
                          color: Colors.white, letterSpacing: 1, fontSize: 10),
                    ),
                    color: Color(0xff1F5471),
                    width: double.infinity,
                    margin: EdgeInsets.only(right: 10, bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                ],
              ),
            ),
          ),
      ],
    ));
  }

  double titleOpacity(double shrinkOffset) {
    print(shrinkOffset);
    // simple formula: fade out text as soon as shrinkOffset > 0
    return 1.0 - max(0.0, shrinkOffset) / maxExtent;
    // more complex formula: starts fading out text when shrinkOffset > minExtent
    //return 1.0 - max(0.0, (shrinkOffset - minExtent)) / (maxExtent - minExtent);
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  // TODO: implement showOnScreenConfiguration
  PersistentHeaderShowOnScreenConfiguration get showOnScreenConfiguration =>
      PersistentHeaderShowOnScreenConfiguration(
          maxShowOnScreenExtent: maxExtent, minShowOnScreenExtent: minExtent);

  @override
  // TODO: implement stretchConfiguration
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;

  @override
  // TODO: implement vsync
  TickerProvider get vsync => null;
}
