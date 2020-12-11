import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hololive/model/Talents.dart';

class TalentHeader extends StatelessWidget {
  final Talents talent;

  const TalentHeader({Key key, this.talent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    buildItem(String label) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(label),
      );
    }

    buildList() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            Text(
              "One day, Ina'nis picked up a strange book and then started to gain the power of controlling tentacles. To her, tentacles are just a part in her ordinary life; it has never been a big deal for her.\n However, her girly mind does want to get them dressed up and stay pretty. After gaining power, she started hearing Ancient Whispers and Revelations. Hence, she began her VTuber activities to deliver random sanity checks on humanity, as an ordinary girl.",
              style: TextStyle(
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
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "Septemb2er 13, 2020",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 16),
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
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "157 cm",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 16),
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
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "May 20th",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 16),
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
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "TentaCultists",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 16),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    return ExpandableNotifier(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      color: Theme.of(context).colorScheme.secondary,
      // padding: const EdgeInsets.all(10),
      child: ScrollOnExpand(
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Container(
                    width: 120,
                    margin: EdgeInsets.only(left: 45, right: 20),
                    child: Stack(
                      overflow: Overflow.visible,
                      children: [
                        Positioned(
                          right: -10,
                          top: 12,
                          child: RotationTransition(
                              turns: new AlwaysStoppedAnimation(30 / 360),
                              child: new Container(
                                color: talent.color,
                                width: 40,
                                height: 110,
                              )),
                        ),
                        Positioned(
                          right: -10,
                          top: 10,
                          child: RotationTransition(
                              turns: new AlwaysStoppedAnimation(15 / 360),
                              child: new Container(
                                color: talent.colorSecond,
                                width: 40,
                                height: 110,
                              )),
                        ),
                        Positioned(
                          left: -10,
                          top: 12,
                          child: RotationTransition(
                              turns: new AlwaysStoppedAnimation(-30 / 360),
                              child: new Container(
                                color: talent.color,
                                width: 40,
                                height: 110,
                              )),
                        ),
                        Positioned(
                          left: -10,
                          top: 10,
                          child: RotationTransition(
                              turns: new AlwaysStoppedAnimation(-15 / 360),
                              child: new Container(
                                color: talent.colorSecond,
                                width: 40,
                                height: 110,
                              )),
                        ),
                        Image.network(
                          talent.image,
                          width: 130,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          talent.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              letterSpacing: 2),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Holo EN",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: 2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToExpand: true,
                  tapBodyToCollapse: true,
                  hasIcon: false,
                ),
                header: Container(
                  // color: Color(0xFFF07222D),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ExpandableIcon(
                          theme: const ExpandableThemeData(
                            expandIcon: Icons.keyboard_arrow_down,
                            collapseIcon: Icons.keyboard_arrow_up,
                            iconColor: Colors.white,
                            iconSize: 28.0,
                            // iconRotationAngle: math.pi / 2,
                            iconPadding: EdgeInsets.only(right: 5),
                            hasIcon: false,
                          ),
                        ),
                        // Expanded(
                        //   child: Text(
                        //     "Items",
                        //     style: Theme.of(context)
                        //         .textTheme
                        //         .body2
                        //         .copyWith(color: Colors.white),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                expanded: buildList(),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

// class TalentHeader extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     buildImg(Color color, double height) {
//       return SizedBox(
//           height: height,
//           child: Container(
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.rectangle,
//             ),
//           ));
//     }

//     buildCollapsed1() {
//       return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     "Expandable",
//                     style: Theme.of(context).textTheme.body1,
//                   ),
//                 ],
//               ),
//             ),
//           ]);
//     }

//     buildCollapsed2() {
//       return buildImg(Colors.lightGreenAccent, 150);
//     }

//     buildCollapsed3() {
//       return Container();
//     }

//     buildExpanded1() {
//       return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     "Expandable",
//                     style: Theme.of(context).textTheme.body1,
//                   ),
//                   Text(
//                     "3 Expandable widgets",
//                     style: Theme.of(context).textTheme.caption,
//                   ),
//                 ],
//               ),
//             ),
//           ]);
//     }

//     buildExpanded2() {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Row(
//             children: <Widget>[
//               Expanded(child: buildImg(Colors.lightGreenAccent, 100)),
//               Expanded(child: buildImg(Colors.orange, 100)),
//             ],
//           ),
//           Row(
//             children: <Widget>[
//               Expanded(child: buildImg(Colors.lightBlue, 100)),
//               Expanded(child: buildImg(Colors.cyan, 100)),
//             ],
//           ),
//         ],
//       );
//     }

//     buildExpanded3() {
//       return Padding(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               "loremIpsum",
//               softWrap: true,
//             ),
//           ],
//         ),
//       );
//     }

//     return ExpandableNotifier(
//         child: Padding(
//       padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//       child: ScrollOnExpand(
//         child: Card(
//           clipBehavior: Clip.antiAlias,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Expandable(
//                 collapsed: buildCollapsed1(),
//                 expanded: buildExpanded1(),
//               ),
//               Expandable(
//                 collapsed: buildCollapsed2(),
//                 expanded: buildExpanded2(),
//               ),
//               Expandable(
//                 collapsed: buildCollapsed3(),
//                 expanded: buildExpanded3(),
//               ),
//               Divider(
//                 height: 1,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   Builder(
//                     builder: (context) {
//                       var controller = ExpandableController.of(context);
//                       return FlatButton(
//                         child: Text(
//                           controller.expanded ? "COLLAPSE" : "EXPAND",
//                           style: Theme.of(context)
//                               .textTheme
//                               .button
//                               .copyWith(color: Colors.deepPurple),
//                         ),
//                         onPressed: () {
//                           controller.toggle();
//                         },
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }

// class TalentHeader extends StatelessWidget {
//   final Talents talent;

//   const TalentHeader({Key key, this.talent}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ExpandableNotifier(
//         child: Padding(
//       padding: const EdgeInsets.all(10),
//       child: Container(
//         child: Column(
//           children: <Widget>[
//             Image.network(
//               talent.image,
//               width: 180,
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Container(
//               child: Text(
//                 talent.name,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontSize: 48,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.white,
//                     letterSpacing: 2),
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Container(
//               child: Text(
//                 "Holo EN",
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.white),
//               ),
//             ),
//             ScrollOnExpand(
//               scrollOnExpand: true,
//               scrollOnCollapse: false,
//               child: ExpandablePanel(
//                 theme: const ExpandableThemeData(
//                   headerAlignment: ExpandablePanelHeaderAlignment.top,
//                   tapBodyToCollapse: true,
//                 ),
//                 header: Padding(
//                   padding: EdgeInsets.all(10),
//                 ),
//                 collapsed: Text(
//                   "aab",
//                   softWrap: true,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 expanded: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     for (var _ in Iterable.generate(5))
//                       Padding(
//                           padding: EdgeInsets.only(bottom: 10),
//                           child: Text(
//                             "abababbbababababbabababbabbbababababababbabs",
//                             softWrap: true,
//                             overflow: TextOverflow.fade,
//                           )),
//                   ],
//                 ),
//                 builder: (_, collapsed, expanded) {
//                   return Padding(
//                     padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
//                     child: Expandable(
//                       collapsed: collapsed,
//                       expanded: expanded,
//                       theme: const ExpandableThemeData(crossFadePoint: 0),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }
