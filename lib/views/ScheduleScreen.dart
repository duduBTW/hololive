import 'package:flutter/material.dart';
import 'package:hololive/components/CardSchedule.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class ScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Talents"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 150,
                color: Colors.red,
                child: Text("aa"),
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                            child: StickyHeader(
                          header: Container(
                            height: 50.0,
                            color: Theme.of(context).scaffoldBackgroundColor,
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '06/12/2020',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 2),
                            ),
                          ),
                          content: Column(
                            children: [
                              CardSchedule(),
                              CardSchedule(),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                            child: StickyHeader(
                          header: Container(
                            height: 50.0,
                            color: Theme.of(context).scaffoldBackgroundColor,
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '07/12/2020',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 2),
                            ),
                          ),
                          content: Column(
                            children: [
                              CardSchedule(),
                              CardSchedule(),
                              CardSchedule(),
                              CardSchedule(),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                  // Container(
                  //   width: double.infinity,
                  //   child: Row(
                  //     children: [
                  //       Container(
                  //         height: MediaQuery.of(context).size.height,
                  //         margin: EdgeInsets.all(30),
                  //         width: 1,
                  //         color: Colors.white,
                  //       ),
                  //       Expanded(
                  //           child: StickyHeader(
                  //         header: Container(
                  //           height: 50.0,
                  //           color: Theme.of(context).colorScheme.secondary,
                  //           padding: EdgeInsets.symmetric(horizontal: 16.0),
                  //           alignment: Alignment.centerLeft,
                  //           child: Text(
                  //             '07/12/2020',
                  //             style: const TextStyle(
                  //                 color: Colors.white,
                  //                 fontSize: 16,
                  //                 fontWeight: FontWeight.w500,
                  //                 letterSpacing: 2),
                  //           ),
                  //         ),
                  //         content: Column(
                  //           children: [
                  //             Container(
                  //               margin: EdgeInsets.only(top: 30, right: 20),
                  //               height: 200,
                  //               color: Colors.white,
                  //             ),
                  //             Container(
                  //               margin: EdgeInsets.only(top: 30, right: 20),
                  //               height: 200,
                  //               color: Colors.white,
                  //             ),
                  //             Container(
                  //               margin: EdgeInsets.only(top: 30, right: 20),
                  //               height: 200,
                  //               color: Colors.white,
                  //             ),
                  //           ],
                  //         ),
                  //       ))
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ));
  }
}
