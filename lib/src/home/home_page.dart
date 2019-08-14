import 'package:flutter/material.dart';
import 'package:perguntando/src/home/card/card_widget.dart';

import 'background/background_widget.dart';
import 'bottom/bottom_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            BackgroundWidget(),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.notifications),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            ListView(
              padding: EdgeInsets.fromLTRB(40, 60, 40, 80),
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                CardWidget(
                  title: "Flutter Talks Brasil",
                  location: "São Paulo/SP",
                  date: "Hoje",
                  imageUrl:
                      "https://eventostech.com.br/wp-content/uploads/2019/06/flutter-talks-br-eventostech-800x450.jpg",
                ),
                SizedBox(height: 25),
                CardWidget(
                  title: "Meetup Flutterando",
                  location: "Hortolândia/SP",
                  date: "02/09/2019",
                  imageUrl:
                      "https://secure.meetupstatic.com/photos/event/4/8/7/c/highres_483018556.jpeg",
                ), SizedBox(height: 25),
                CardWidget(
                  title: "Meetup Flutterando",
                  location: "Hortolândia/SP",
                  date: "02/09/2019",
                  imageUrl:
                      "https://secure.meetupstatic.com/photos/event/4/8/7/c/highres_483018556.jpeg",
                ), SizedBox(height: 25),
                CardWidget(
                  title: "Meetup Flutterando",
                  location: "Hortolândia/SP",
                  date: "02/09/2019",
                  imageUrl:
                      "https://secure.meetupstatic.com/photos/event/4/8/7/c/highres_483018556.jpeg",
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: BottomWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
