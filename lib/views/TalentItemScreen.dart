import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hololive/components/TalentHeader.dart';
import 'package:hololive/model/Talents.dart';
import 'package:hololive/providers/YoutubeItems.dart';
import 'package:provider/provider.dart';
// import 'ur';

class TalentItemScreen extends StatefulWidget {
  final Talents talent;

  const TalentItemScreen({Key key, this.talent}) : super(key: key);
  // final Talents talent = Talents(
  //     color: Color(0xFF5A263B),
  //     name: 'Mori Calliope',
  //     image:
  //         "https://user-images.strikinglycdn.com/res/hrscywv4p/image/upload/c_limit,fl_lossy,h_1000,w_500,f_auto,q_auto/1369026/603788_561144.jpeg");

  @override
  _TalentItemScreenState createState() => _TalentItemScreenState();
}

class _TalentItemScreenState extends State<TalentItemScreen> {
  final List<String> buttonList = ["Follow", "Twitter", "Youtube", "Twitch"];

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<YoutubeItems>(context, listen: false)
        .attStatus(widget.talent.channelId);
    super.initState();
  }

//   _launchURL() async {
//   if (Platform.isIOS) {
//     if (await canLaunch('youtube://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw')) {
//       await launch('youtube://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw', forceSafariVC: false);
//     } else {
//       if (await canLaunch('https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw')) {
//         await launch('https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw');
//       } else {
//         throw 'Could not launch https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw';
//       }
//     }
//   } else {
//     const url = 'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
// }

  @override
  Widget build(BuildContext context) {
    // final talent = ModalRoute.of(context).settings.arguments as ;
    final talentItemsList = Provider.of<YoutubeItems>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        // backgroundColor: talent.color,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.talent.name,
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
                talent: widget.talent,
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
                padding: EdgeInsets.symmetric(vertical: 20),
                height: 140,
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
              // SizedBox(
              //   height: 15,
              // ),
              if (talentItemsList.loading)
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(20),
                  child: CircularProgressIndicator(),
                  // height: 100,
                ),
              if (!talentItemsList.loading && talentItemsList.youtube != null)
                Container(
                  height: MediaQuery.of(context).size.height - 200,
                  child: ListView.builder(
                    itemCount: talentItemsList.youtube.length,
                    itemBuilder: (context, index) {
                      final itemYt = talentItemsList.youtube[index];
                      return Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        color: Theme.of(context).colorScheme.secondary,
                        child: Column(
                          children: [
                            Image.network(
                              itemYt.snippet.thumbnails.medium.url,
                              // alignment: Alignment(0, 0),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 320,
                              alignment: Alignment(0.0, 0.0),
                              child: Text(
                                itemYt.snippet.title,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
