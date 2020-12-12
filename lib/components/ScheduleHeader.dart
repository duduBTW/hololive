import 'package:flutter/material.dart';
import 'package:hololive/model/Talents.dart';

class ScheduleHeader extends StatelessWidget {
  final List<Talents> talentList = [
    Talents(
        color: Color(0xFF50413D),
        colorSecond: Color(0xFFD6A99A),
        name: "Amelia Watson",
        image:
            "https://user-images.strikinglycdn.com/res/hrscywv4p/image/upload/c_limit,fl_lossy,h_1000,w_500,f_auto,q_auto/1369026/112336_876930.jpeg"),
    Talents(
        color: Color(0xFF292031),
        name: "Ninomae Ina'nis",
        image:
            "https://user-images.strikinglycdn.com/res/hrscywv4p/image/upload/c_limit,fl_lossy,h_1000,w_500,f_auto,q_auto/1369026/712914_145875.jpeg"),
    Talents(
        color: Color(0xFF234D69),
        name: 'Gawr Gura',
        image:
            "https://user-images.strikinglycdn.com/res/hrscywv4p/image/upload/c_limit,fl_lossy,h_1000,w_500,f_auto,q_auto/1369026/251247_457554.jpeg"),
    Talents(
        color: Color(0xFF8B3418),
        name: 'Takanashi Kiara',
        image:
            "https://user-images.strikinglycdn.com/res/hrscywv4p/image/upload/c_limit,fl_lossy,h_1000,w_500,f_auto,q_auto/1369026/207430_877763.jpeg"),
    Talents(
        color: Color(0xFF5A263B),
        name: 'Mori Calliope',
        image:
            "https://user-images.strikinglycdn.com/res/hrscywv4p/image/upload/c_limit,fl_lossy,h_1000,w_500,f_auto,q_auto/1369026/603788_561144.jpeg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 124,
      color: Theme.of(context).colorScheme.secondary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(18),
            child: Text(
              "Hololive EN schedule",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: OutlineButton.icon(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25.0)),
                    label: Text(
                      "Filter",
                      style: const TextStyle(color: Colors.white),
                    ),
                    icon: Icon(
                      Icons.filter_list,
                      color: Colors.white,
                    ),
                    onPressed: () => {}
                    //     () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => TypesEpi()),
                    //   );
                    // },
                    ),
              ),
              Expanded(
                child: SizedBox(
                  // width: 100,
                  height: 100,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      // return Container(
                      //   margin: EdgeInsets.all(10),
                      //   width: 120,
                      //   height: 20,
                      //   color: Colors.red,
                      // );
                      return Container(
                        width: 54,
                        height: 54,
                        margin: EdgeInsets.all(6),
                        child: Image.network(
                          talentList[index].image,
                          // color: Colors.black.withOpacity(0.25),
                        ),
                      );
                    },
                    itemCount: talentList.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//              Text("Hololive EN schedule"),
