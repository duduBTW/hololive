import 'package:flutter/material.dart';
import 'package:hololive/model/Talents.dart';
import 'package:hololive/views/talent/item.dart';

class TalentsScreen extends StatefulWidget {
  @override
  _TalentsScreenState createState() => _TalentsScreenState();
}

class _TalentsScreenState extends State<TalentsScreen>
    with AutomaticKeepAliveClientMixin {
  void _redireceToTalent(BuildContext ctx, Talents talent) =>
      Navigator.of(ctx).push(MaterialPageRoute(
          builder: (context) => TalentItemScreen(talent: talent)));

  final List<Talents> talentList = [
    Talents(
        color: Color(0xFF50413D),
        colorSecond: Color(0xFFD6A99A),
        name: "Amelia Watson",
        twitterName: "watsonameliaEN",
        banner:
            "https://yt3.ggpht.com/-7bdk5QyCEcy8DcCAwxFqjA3VX1WnMJKFg6mhVCqnL6z4S0boWQ1JkIgyCGXN8amRnYdQNkn",
        image:
            'https://firebasestorage.googleapis.com/v0/b/hololive-6a02e.appspot.com/o/ame.jpg?alt=media&token=2616ab4c-b337-4c30-b77b-7a2dd1f5605d',
        channelId: "UCyl1z3jo3XHR1riLFKG5UAg"),
    Talents(
        channelId: "UCMwGHR0BTZuLsmjY_NT5Pwg",
        color: Color(0xFF292031),
        name: "Ninomae Ina'nis",
        image:
            "https://firebasestorage.googleapis.com/v0/b/hololive-6a02e.appspot.com/o/ina.jpeg?alt=media&token=72baaaba-1ab3-468f-9cbe-9886a1017c93"),
    Talents(
        channelId: "UCoSrY_IQQVpmIRZ9Xf-y93g",
        color: Color(0xFF234D69),
        name: 'Gawr Gura',
        image:
            "https://firebasestorage.googleapis.com/v0/b/hololive-6a02e.appspot.com/o/gura.jpeg?alt=media&token=0e10ba8d-214c-475f-b42e-07a015b66da9"),
    Talents(
        channelId: "UCHsx4Hqa-1ORjQTh9TYDhww",
        color: Color(0xFF8B3418),
        name: 'Takanashi Kiara',
        twitterName: 'takanashikiara',
        image:
            "https://firebasestorage.googleapis.com/v0/b/hololive-6a02e.appspot.com/o/kiara.jpeg?alt=media&token=c20cc81b-de00-41f3-99fa-712db5e7b0b0"),
    Talents(
        channelId: "UCL_qhgtOy0dy1Agp8vkySQg",
        color: Color(0xFF5A263B),
        name: 'Mori Calliope',
        image:
            "https://firebasestorage.googleapis.com/v0/b/hololive-6a02e.appspot.com/o/calli.jpeg?alt=media&token=8e738758-fc76-426d-a961-967e5f74a55e"),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: SafeArea(
              child: Ink(
                color: Theme.of(context).primaryColor,
                child: TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(
                      text: "All",
                    ),
                    Tab(
                      text: "Hololive",
                    ),
                    Tab(
                      text: "Hololive EN",
                    ),
                    Tab(
                      text: "Hololive Music",
                    ),
                    Tab(
                      text: "Hololive Indonesia",
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20),
                child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 15,
                    children: talentList
                        .map((item) => GestureDetector(
                              onTap: () => _redireceToTalent(context, item),
                              child: Container(
                                child: Column(
                                  children: [
                                    if (item.image != null &&
                                        item.image.isNotEmpty)
                                      Hero(
                                        tag: item.name,
                                        child: Image.network(
                                          item.image,
                                          height: 120,
                                        ),
                                      ),
                                    Container(
                                      color: item.color,
                                      width: double.infinity,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Text(
                                        item.name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                        .toList()),
              ),
              Container(
                child: Center(
                  child: Text('Tab 2'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 3'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 2'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 3'),
                ),
              ),
            ],
          )),
    );

    // Container(
    //   margin: EdgeInsets.only(top: 20),
    //   child: GridView.count(
    //       crossAxisCount: 2,
    //       crossAxisSpacing: 15.0,
    //       mainAxisSpacing: 10,
    //       children: talentList
    //           .map((item) => GestureDetector(
    //                 onTap: () => _redireceToTalent(context, item),
    //                 child: Container(
    //                   child: Column(
    //                     children: [
    //                       if (item.image != null && item.image.isNotEmpty)
    //                         Hero(
    //                           tag: item.name,
    //                           child: Image.network(
    //                             item.image,
    //                             height: 120,
    //                           ),
    //                         ),
    //                       Container(
    //                         color: item.color,
    //                         width: double.infinity,
    //                         padding: EdgeInsets.symmetric(vertical: 10),
    //                         child: Text(
    //                           item.name,
    //                           textAlign: TextAlign.center,
    //                           style: TextStyle(
    //                               color: Colors.white,
    //                               fontWeight: FontWeight.w500),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ))
    //           .toList()),
    // ),
    //);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
