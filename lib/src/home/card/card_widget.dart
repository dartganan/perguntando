import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final String date;

  const CardWidget({
    Key key,
    this.imageUrl,
    this.title,
    this.location,
    this.date,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: Container(
        height: 170,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Spacer(),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.black.withOpacity(.7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      location,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
