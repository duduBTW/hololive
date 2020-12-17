import 'package:flutter/material.dart';
import 'package:hololive/components/CardSchedule.dart';
import 'package:hololive/components/ScheduleHeader.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          ScheduleHeader(),
          IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  width: 15,
                  // flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 0, horizontal: 7),
                    // height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: Column(
                    children: [
                      Container(
                          width: double.infinity,
                          child: Expanded(
                              child: StickyHeader(
                            header: Container(
                              height: 40.0,
                              color: Color(0xFFF07222D),
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
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
                          ))),
                      Container(
                          width: double.infinity,
                          child: Expanded(
                              child: StickyHeader(
                            header: Container(
                              height: 40.0,
                              color: Color(0xFFF07222D),
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
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
                          ))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
