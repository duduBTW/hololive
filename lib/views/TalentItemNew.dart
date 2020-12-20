import 'package:flutter/material.dart';
import 'package:hololive/model/YoutubeModel.dart';

import 'package:hololive/components/generics/PaginatedContainer.dart';
import 'package:hololive/model/Talents.dart';
import 'package:url_launcher/url_launcher.dart';

class TalentItemScreen extends StatelessWidget {
  final Talents talent;

  const TalentItemScreen({Key key, this.talent}) : super(key: key);

  _launchURL(String id) async {
    // if (Platform.isIOS) {
    //   if (await canLaunch('youtube://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw')) {
    //     await launch('youtube://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw', forceSafariVC: false);
    //   } else {
    //     if (await canLaunch('https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw')) {
    //       await launch('https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw');
    //     } else {
    //       throw 'Could not launch https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw';
    //     }
    //   }
    // } else {
    final url = 'https://www.youtube.com/watch?v=$id';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaginatedTalent(talent: talent, launchURL: _launchURL),
    );
  }
}
