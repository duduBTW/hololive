import 'package:flutter/material.dart';
import 'package:hololive/model/ScheduleModel.dart';
import 'package:hololive/model/Talents.dart';

class ScheduleItemSreen extends StatelessWidget {
  final ScheduleModel schedule = ScheduleModel(
    time: "10 AM",
    thumb: "https://i.ytimg.com/vi/uO0fzCt3yNA/maxresdefault.jpg",
    talent: Talents(
        color: Color(0xFF5A263B),
        name: 'Mori Calliope',
        image:
            "https://user-images.strikinglycdn.com/res/hrscywv4p/image/upload/c_limit,fl_lossy,h_1000,w_500,f_auto,q_auto/1369026/603788_561144.jpeg"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Hero(
              tag: 'Thumb',
              child: Image.network(
                schedule.thumb,
              ),
            ),
            Hero(tag: 'Talent', child: Image.network(schedule.talent.image)),
          ],
        ),
      ),
    );
  }
}
