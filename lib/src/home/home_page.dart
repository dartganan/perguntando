import 'package:flutter/material.dart';
import 'package:perguntando/src/shared/card/card_shimmer.dart';
import 'package:perguntando/src/shared/card/card_widget.dart';

import 'appbar/appbar_widget.dart';
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
      body: Stack(
        children: <Widget>[
          BackgroundWidget(),
          AppbarWidget(),
          ListView(
            padding: EdgeInsets.fromLTRB(
              40,
              60 + MediaQuery.of(context).viewPadding.top,
              40,
              80 + MediaQuery.of(context).viewPadding.bottom,
            ),
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              CardShimmer(),
              SizedBox(height: 25),
              CardWidget(
                title: "Flutter Talks Brasil",
                subtitle: "São Paulo/SP\nHoje",
                imageUrl: "https://eventostech.com.br/wp-content/uploads/2019/06/flutter-talks-br-eventostech-800x450.jpg",
                onPressed: () {},
              ),
              SizedBox(height: 25),
              CardWidget(
                title: "Meetup Flutterando",
                subtitle: "Hortolândia/SP\n02/09/2019",
                imageUrl: "https://secure.meetupstatic.com/photos/event/4/8/7/c/highres_483018556.jpeg",
                onPressed: () {},
              ),
              SizedBox(height: 25),
              CardWidget(
                title: "Flutter Talks Brasil",
                subtitle: "São Paulo/SP\nHoje",
                imageUrl: "https://eventostech.com.br/wp-content/uploads/2019/06/flutter-talks-br-eventostech-800x450.jpg",
                onPressed: () {},
              ),
              SizedBox(height: 25),
              CardWidget(
                title: "Meetup Flutterando",
                subtitle: "Hortolândia/SP\n02/09/2019",
                imageUrl: "https://secure.meetupstatic.com/photos/event/4/8/7/c/highres_483018556.jpeg",
                onPressed: () {},
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: BottomWidget(),
          ),
        ],
      ),
    );
  }
}
