import 'package:flutter/material.dart';
import 'package:hololive/components/CardYoutuber.dart';
import 'package:hololive/model/Translator.dart';

class TranslatorsScreen extends StatelessWidget {
  final List<Translator> translatorList = [
    Translator(
        name: "SodaFunk Ch.",
        youtubeLink: 'https://www.youtube.com/c/HololiveClips',
        subs: '49 mil inscritos',
        image:
            'https://yt3.ggpht.com/ytc/AAUvwnjEkAmzOlrzdQyC1Lnc6HaaBwIVZXeMsnzzHOgu5g=s188-c-k-c0x00ffffff-no-rj'),
    Translator(
        name: "Hololive Clips",
        youtubeLink: 'https://www.youtube.com/c/HololiveClips',
        subs: '2,77 mil inscritos',
        image:
            'https://yt3.ggpht.com/ytc/AAUvwngA4SGTXkc7aFdEhphZpuDIWucJ1s4Y1gJKH8oz=s180-c-k-c0x00ffffff-no-rj'),
    Translator(
        name: "HoloLive Sings",
        youtubeLink: 'https://www.youtube.com/c/HololiveClips',
        subs: '85,9 mil inscritos',
        image:
            'https://yt3.ggpht.com/ytc/AAUvwngmktACfmWQXehhsMUpdnJs-uLMsJ-JVRcki9B9=s188-c-k-c0x00ffffff-no-rj'),
    Translator(
        name: "Anti",
        youtubeLink: 'https://www.youtube.com/c/HololiveClips',
        subs: '24,3 mil inscritos',
        image:
            'https://yt3.ggpht.com/ytc/AAUvwniN1mqdWHLFf-SyvED56jaopHiQ1kKbPKU-XQe6xA=s188-c-k-c0x00ffffff-no-rj'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: translatorList.length,
        itemBuilder: (context, index) => CardYoutuber(
              translator: translatorList[index],
            ));
  }
}
