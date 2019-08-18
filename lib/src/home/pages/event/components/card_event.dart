import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardEvent extends StatelessWidget {
  final Function onPressed;
  final String tag;

  const CardEvent({
    Key key,
    this.onPressed,
    @required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(
        children: <Widget>[
          Hero(
            tag: tag,
            child: Container(
              width: 230,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            width: 230,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Hero(
                      tag: "${tag}_image",
                      child: CircleAvatar(
                        maxRadius: 30,
                        backgroundImage: CachedNetworkImageProvider(
                          "https://i.udemycdn.com/user/200_H/51101684_c590_2.jpg",
                        ),
                      ),
                    ),
                    Hero(
                      tag: "${tag}_time",
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          "10:00",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Hero(
                  tag: "${tag}_name",
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      "Jacob Moura",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Container(height: 5),
                Hero(
                  tag: "${tag}_talk",
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      "Nunca diga não para o seu designer",
                      style: TextStyle(color: Colors.grey[700], fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.commentAlt,
                      color: Colors.grey[500],
                      size: 18,
                    ),
                    Container(
                      width: 3,
                    ),
                    Text(
                      "+99",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
