import 'package:flutter/material.dart';
import 'package:hololive/model/YoutubeModel.dart';
import 'package:hololive/providers/talent/talent.dart';
import 'package:provider/provider.dart';

import '../../components/Talents/TalentBody.dart';
import 'package:hololive/model/Talents.dart';
import 'package:url_launcher/url_launcher.dart';

class TalentItemScreen extends StatelessWidget {
  final Talents talent;

  const TalentItemScreen({Key key, this.talent}) : super(key: key);

  _launchURL(String id) async {
    final url = 'https://www.youtube.com/watch?v=$id';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _openFilters(BuildContext context) =>
      Navigator.of(context).pushNamed('/talent/filters');

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: TalentController())],
      child: Scaffold(
        body: PaginatedTalent(
            talent: talent, launchURL: _launchURL, openFilters: _openFilters),
      ),
    );
  }
}
