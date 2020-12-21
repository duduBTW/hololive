import 'package:flutter/material.dart';
import 'package:hololive/model/YoutubeModel.dart';
import 'package:intl/intl.dart';

class GenericListItem extends StatelessWidget {
  final Function launchURL;
  final Item itemYt;

  const GenericListItem({Key key, this.launchURL, this.itemYt})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () => launchURL(itemYt.snippet.resourceId.videoId),
        child: Ink(
          color: Theme.of(context).colorScheme.secondary,
          width: double.infinity,
          // margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              Image.network(
                itemYt.snippet.thumbnails.medium.url,
                alignment: Alignment(0, 0),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 320,
                // alignment: Alignment(0.0, 0.0),
                child: Text(
                  itemYt.snippet.title,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 320,
                // alignment: Alignment(0.0, 0.0),
                child: Text(
                  DateFormat('dd/MM/yyyy HH:mm')
                      .format(itemYt.snippet.publishedAt),
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
