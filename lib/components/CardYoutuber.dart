import 'package:flutter/material.dart';
import 'package:hololive/model/Translator.dart';

class CardYoutuber extends StatelessWidget {
  final Translator translator;

  const CardYoutuber({Key key, this.translator}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(left: 20, right: 20, top: 28, bottom: 6),
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
                padding: EdgeInsets.only(left: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('SEE CHANNEL'),
                    Container(
                      height: 20,
                      width: 1,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    Text('UNFOLLOW'),
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
              bottom: 20,
              child: Container(
                height: 90,
                width: 90,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.network(translator.image),
                ),
              ),
            ),
            //TEXT
            Positioned(
              left: 120,
              bottom: 60,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      translator.name,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      translator.subs,
                      style: TextStyle(
                          fontSize: 10, color: Colors.white, letterSpacing: 2),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
