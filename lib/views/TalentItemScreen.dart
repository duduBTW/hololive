import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hololive/components/TalentHeader.dart';
import 'package:hololive/model/Talents.dart';

class TalentItemScreen extends StatelessWidget {
  // final Talents talent = Talents(
  //     color: Color(0xFF5A263B),
  //     name: 'Mori Calliope',
  //     image:
  //         "https://user-images.strikinglycdn.com/res/hrscywv4p/image/upload/c_limit,fl_lossy,h_1000,w_500,f_auto,q_auto/1369026/603788_561144.jpeg");

  @override
  Widget build(BuildContext context) {
    final talent = ModalRoute.of(context).settings.arguments as Talents;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: talent.color,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          talent.name,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              TalentHeader(
                talent: talent,
              ),
              // IconButton(
              //   onPressed: () {},
              //   icon: Icon(Icons.expand_more, size: 34, color: Colors.white),
              // ),
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