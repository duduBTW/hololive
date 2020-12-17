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
    return GestureDetector(
      onTap: () => launchURL(itemYt.snippet.resourceId.videoId),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        color: Theme.of(context).colorScheme.secondary,
        child: Column(
          children: [
            Image.network(
              itemYt.snippet.thumbnails.medium.url,
              alignment: Alignment(0, 0),
            ),
            SizedBox(
              height: 10,
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
    );
  }
}
