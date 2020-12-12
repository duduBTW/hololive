import 'package:flutter/material.dart';

class Talents {
  final String name;
  final String image;
  final Color color;
  final Color colorSecond;
  final String channelId;

  Talents(
      {this.image,
      @required this.name,
      @required this.color,
      this.colorSecond,
      this.channelId});
}
