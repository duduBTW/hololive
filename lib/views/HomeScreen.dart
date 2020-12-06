import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  void _redirectItem(BuildContext context, int page) {
    switch (page) {
      case 0:
        Navigator.of(context).pushNamed('/talents');
        break;
      case 1:
        Navigator.of(context).pushNamed('/translators');
        break;
      // default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("yay Inicio"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (page) => _redirectItem(context, page),
        backgroundColor: Theme.of(context).backgroundColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.group,
              ),
              title: Text('Talents')),
          BottomNavigationBarItem(
              icon: Icon(Icons.translate), title: Text('Translators')),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), title: Text('Schedule')),
        ],
      ),
    );
  }
}
