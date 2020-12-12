import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hololive/components/TalentHeader.dart';
import 'package:hololive/model/Talents.dart';

class TalentItemScreen extends StatelessWidget {
  // final Talents talent = Talents(
  //     color: Color(0xFF5A263B),
  //     name: 'Mori Calliope',
  //     image:
  //         "https://user-images.strikinglycdn.com/res/hrscywv4p/image/upload/c_limit,fl_lossy,h_1000,w_500,f_auto,q_auto/1369026/603788_561144.jpeg");

  final List<String> buttonList = ["Follow", "Twitter", "Youtube", "Twitch"];

  @override
  Widget build(BuildContext context) {
    final talent = ModalRoute.of(context).settings.arguments as Talents;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        // backgroundColor: talent.color,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          talent.name,
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TalentHeader(
                talent: talent,
              ),
              // IconButton(
              //   onPressed: () {},
              //   icon: Icon(Icons.expand_more, size: 34, color: Colors.white),
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              Container(
                width: double.infinity,
                color: Theme.of(context).colorScheme.secondary,
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: buttonList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: 100,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.transit_enterexit),
                              Text(buttonList[index]),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 15,
              ),
              ...List.generate(
                  20,
                  (index) => Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(20),
                        child: Text(index.toString()),
                      )).toList()
            ],
          ),
        ),
      ),
    );
  }
}
