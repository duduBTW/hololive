import 'package:flutter/material.dart';
import 'package:hololive/model/ScheduleModel.dart';
import 'package:hololive/model/Talents.dart';

class CardSchedule extends StatelessWidget {
  final ScheduleModel schedule = ScheduleModel(
    time: "10 AM",
    thumb: "https://i.ytimg.com/vi/uO0fzCt3yNA/maxresdefault.jpg",
    talent: Talents(
        color: Color(0xFF5A263B),
        name: 'Mori Calliope',
        image:
            "https://user-images.strikinglycdn.com/res/hrscywv4p/image/upload/c_limit,fl_lossy,h_1000,w_500,f_auto,q_auto/1369026/603788_561144.jpeg"),
  );

  // const CardSchedule({Key key, this.schedule}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 6),
        // color: Colors.red,
        height: 130,
        width: double.infinity,
        child: Stack(
          overflow: Overflow.visible,
          fit: StackFit.expand,
          children: [
            //White bottom
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Icon(Icons.access_time),
                    SizedBox(
                      width: 15,
                    ),
                    Text(schedule.time,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ],
                ),
                // color: Colors.white,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                height: 40,
              ),
            ),
            //Picture
            Positioned(
              left: 15,
              bottom: 55,
              child: Container(
                height: 50,
                width: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.network(schedule.talent.image),
                ),
              ),
            ),
            //TEXT
            Positioned(
              left: 80,
              bottom: 70,
              child: Container(
                child: Text(
                  schedule.talent.name.split(" ")[0],
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2),
                ),
              ),
            ),
            //Picture
            Positioned(
              right: 15,
              bottom: 20,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(4, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Image.network(
                  schedule.thumb,
                  width: 160,
                ),
              ),
            ),
          ],
        ));
  }
}
