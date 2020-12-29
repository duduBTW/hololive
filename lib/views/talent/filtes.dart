import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hololive/providers/talent/talent.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class FiltersTalentScreen extends StatelessWidget {
  void _youtubeHink(BuildContext ctx) {
    showBarModalBottomSheet(
      context: ctx,
      expand: false,
      builder: (
        context,
      ) =>
          Container(
              height: 200,
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Number of items per page",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                      "For exemple, if you set the twitter value low and the youtube high you'll have a lot more youtube posts."),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: RaisedButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      child: Text('Ok (ノ￣ω￣)ノ'),
                    ),
                  )
                ],
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    var filters = Provider.of<TalentController>(context).filters;
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Show',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(
              height: 20,
            ),
            ToggleButtons(
              children: [
                // Icon(Icons.access_alarm),
                Container(
                  height: 100,
                  width: 100,
                  child: Center(child: Text('Twitter')),
                ),
                Container(
                  height: 100,
                  width: 100,
                  child: Center(child: Text('Youtube')),
                )
              ],
              color: Colors.white,
              selectedColor: Colors.white,
              borderColor: Colors.white,
              isSelected: filters.medias,
              // onPressed: filters.setMedia,
            ),
            if (!filters.medias[0] && !filters.medias[1]) ...[
              SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  height: 200,
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                    fit: BoxFit.fitWidth,
                    alignment: FractionalOffset.center,
                    image: new NetworkImage(
                        'https://pbs.twimg.com/media/EjqKuZ5UYAAjyvm.jpg'),
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40),
                child: Text(
                  "If you disable all the options there's nothing to show",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              )
            ],
            if (filters.medias[0]) ...[
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Twitter Results per page',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.help,
                        size: 22,
                        color: Colors.white,
                      ),
                      onPressed: () {})
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Slider(
                value: filters.twitterPerPage,
                min: 5,
                max: 15,
                divisions: 10,
                label: filters.twitterPerPage.round().toString(),
                onChanged: (double value) {
                  // filters.twitterPerPage = value;
                },
              ),
            ],
            if (filters.medias[1]) ...[
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Youtube Results per page',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.help,
                        size: 22,
                        color: Colors.white,
                      ),
                      onPressed: () => _youtubeHink(context))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Slider(
                value: filters.youtubePerPage,
                min: 5,
                max: 30,
                divisions: 30 - 5,
                label: filters.youtubePerPage.round().toString(),
                onChanged: (double value) {
                  // filters.youtubePerPage = value;
                },
              ),
            ]
          ],
        ),
      ),
    );
  }
}
