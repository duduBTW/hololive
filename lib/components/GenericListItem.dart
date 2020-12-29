import 'package:flutter/material.dart';
import 'package:hololive/model/ResultItem.dart';
import 'package:hololive/model/YoutubeModel.dart';
import 'package:intl/intl.dart';

class GenericListItem extends StatelessWidget {
  final Function launchURL;
  final ReusltItem item;

  const GenericListItem({Key key, this.launchURL, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.secondary,
      child: InkWell(
        onTap: () => launchURL(item),
        // width: double.infinity,
        // margin: EdgeInsets.symmetric(vertical: 10),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  // child: Text('aa'),
                  ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 320,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            item.getType(),
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 12),
                          ),
                        ),
                        Container(
                          child: Text(
                            DateFormat('dd/MM HH:mm').format(item.date),
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 320,
                    // alignment: Alignment(0.0, 0.0),
                    child: Text(
                      item.title.trim(),
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          height: 1.6),
                    ),
                  ),
                  if (item.image != null)
                    SizedBox(
                      height: 20,
                    ),
                  if (item.image != null)
                    ConstrainedBox(
                      constraints: new BoxConstraints(
                        maxHeight: 180,
                        maxWidth: 320,
                      ),
                      child: new Container(
                        decoration: new BoxDecoration(
                            image: new DecorationImage(
                          fit: BoxFit.fitWidth,
                          alignment: FractionalOffset.center,
                          image: new NetworkImage(item.image),
                        )),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
