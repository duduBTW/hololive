import 'package:flutter/material.dart';
import 'dart:math';

class LoadingHololive extends StatefulWidget {
  @override
  _LoadingHololiveState createState() => _LoadingHololiveState();
}

class _LoadingHololiveState extends State<LoadingHololive>
    with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(seconds: 4), vsync: this, upperBound: pi * 2)
      ..repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: animationController,
            child: Container(
              width: 100,
              height: 100,
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                fit: BoxFit.fitWidth,
                alignment: FractionalOffset.center,
                image: new NetworkImage(
                    'https://i.pinimg.com/originals/40/6c/ea/406ceaf8b409a4f3e1bacef2cd084592.gif'),
              )),
            ),
            builder: (context, _widget) {
              return Transform.rotate(
                angle: animationController.value,
                child: _widget,
              );
            },
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Loading...',
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
