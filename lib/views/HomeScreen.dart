import 'package:flutter/material.dart';
import 'package:hololive/views/ScheduleScreen.dart';
import 'package:hololive/views/TalentsScreen.dart';
import 'package:hololive/views/TranslatorScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  int _currentIndex = 0;
  final List<Widget> _childern = [
    TalentsScreen(),
    TranslatorsScreen(),
    ScheduleScreen(),
  ];

  void _onPageChanged(int index) {
    // _pageController.jumpToPage(index);
    setState(() {
      _currentIndex = index;
    });
  }

  void _redirectItem(BuildContext context, int page) {
    _pageController.jumpToPage(page);
    // switch (page) {
    //   case 0:
    //     Navigator.of(context).pushNamed('/talents');
    //     break;
    //   case 1:
    //     Navigator.of(context).pushNamed('/translators');
    //     break;
    //   case 2:
    //     Navigator.of(context).pushNamed('/schedules');
    //     break;
    //   // default:
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _childern,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
        // child: _childern[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (page) => _redirectItem(context, page),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        unselectedItemColor: Colors.grey,
        fixedColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          // BottomNavigationBarItem(
          //     icon: Icon(
          //       Icons.home,
          //     ),
          //     title: Text('Home')),
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
