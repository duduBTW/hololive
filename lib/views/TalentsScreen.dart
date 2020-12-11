import 'package:flutter/material.dart';
import 'package:hololive/model/Talents.dart';

class TalentsScreen extends StatelessWidget {
  void _redireceToTalent(BuildContext ctx, Talents talent) =>
      Navigator.of(ctx).pushNamed('/talent', arguments: talent);

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Talents'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 10,
            children: talentList
                .map((item) => GestureDetector(
                      onTap: () => _redireceToTalent(context, item),
                      child: Container(
                        child: Column(
                          children: [
                            if (item.image != null && item.image.isNotEmpty)
                              Image.network(
                                item.image,
                                height: 120,
                              ),
                            Container(
                              color: item.color,
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 10),
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
    );
  }
}
