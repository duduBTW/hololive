import 'package:flutter/material.dart';
import 'package:hololive/views/HomeScreen.dart';
import 'package:hololive/views/ScheduleItemScreen.dart';
import 'package:hololive/views/ScheduleScreen.dart';
import 'package:hololive/views/TalentItemScreen.dart';
import 'package:hololive/views/TalentsScreen.dart';
import 'package:hololive/views/TranslatorScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Color(0xff136380),
        backgroundColor: Color(0xFF0A3140),
        scaffoldBackgroundColor: Color(0xFF082A37),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      routes: {
        '/talents': (ctx) => TalentsScreen(),
        '/talent': (ctx) => TalentItemScreen(),
        '/translators': (ctx) => TranslatorsScreen(),
        '/schedules': (ctx) => ScheduleScreen(),
        '/schedulesItem': (ctx) => ScheduleItemSreen()
      },
    );
  }
}
