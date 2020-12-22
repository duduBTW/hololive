import 'package:flutter/material.dart';
import 'package:hololive/views/ScheduleScreen.dart';
import 'package:hololive/views/TalentsScreen.dart';
import 'package:hololive/views/TranslatorScreen.dart';
import 'package:hololive/views/community/index.dart';

import 'MainScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  int _currentIndex = 0;
  final List<Widget> _childern = [
    MainScreen(),
    TalentsScreen(),
    CommynityScreen(),
    ScheduleScreen(),
  ];

  void _onPageChanged(int index) => setState(() {
        _currentIndex = index;
      });

  void _redirectItem(BuildContext context, int page) =>
      _pageController.jumpToPage(page);

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
                Icons.home,
              ),
              title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.group,
              ),
              title: Text('Talents')),
          BottomNavigationBarItem(
              icon: Icon(Icons.comment), title: Text('Community')),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), title: Text('Schedule')),
        ],
      ),
    );
  }
}
