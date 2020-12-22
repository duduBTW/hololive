import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hololive/views/TranslatorScreen.dart';

class Filters extends StatelessWidget {
  static const List<String> _tabs = ["Filters", "Reddit", "Youtube"];
  List<Widget> _content = [
    Text(
      "Filters",
    ),
    Text(
      "Reddit",
    ),
    SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "My list",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            child: TranslatorsScreen(),
            height: 400,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {},
              child: Text("Add channel"),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: double.infinity,
            child: OutlinedButton(
              style: ButtonStyle(
                side: MaterialStateProperty.resolveWith((states) {
                  Color _borderColor;

                  if (states.contains(MaterialState.disabled)) {
                    _borderColor = Colors.grey;
                  } else if (states.contains(MaterialState.pressed)) {
                    _borderColor = Colors.white;
                  } else {
                    _borderColor = Colors.white;
                  }

                  return BorderSide(color: _borderColor, width: 1);
                }),
              ),
              onPressed: () {},
              child: Text(
                "History",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Popular channels",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            child: TranslatorsScreen(),
            height: 400,
          ),
        ],
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Filters"),
          bottom: TabBar(
            tabs: [
              ..._tabs
                  .map((tabItem) => Tab(
                        text: tabItem,
                      ))
                  .toList()
            ],
          ),
        ),
        body: TabBarView(
          children: [..._content.map((tabItem) => tabItem).toList()],
        ),
      ),
    );
  }
}
