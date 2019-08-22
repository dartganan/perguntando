import 'package:flutter/material.dart';
import 'package:perguntando/src/login/login_module.dart';
import 'package:radial_button/widget/circle_floating_button.dart';

import 'login_bloc.dart';
import 'pages/page_login/page_login_page.dart';
import 'pages/page_register/page_register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var bloc = LoginModule.to.getBloc<LoginBloc>();

  var itemsActionBar = [
    FloatingActionButton(
      heroTag: "ffreofkprj3093",
      backgroundColor: Colors.greenAccent,
      onPressed: () {},
      child: Icon(Icons.add),
    ),
    FloatingActionButton(
      heroTag: "dsad3e2fd2",
      backgroundColor: Colors.indigoAccent,
      onPressed: () {},
      child: Icon(Icons.camera),
    ),
    FloatingActionButton(
      heroTag: "4322fh6jk",
      backgroundColor: Colors.orangeAccent,
      onPressed: () {},
      child: Icon(Icons.card_giftcard),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Image.asset(
              "assets/background.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Color(0xffcc000000),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: bloc.pageController,
            children: <Widget>[PageLoginPage(), PageRegisterPage()],
          ),
          Positioned(
              top: 0,
              left: -60,
              child: CircleFloatingButton(
                position: Position.top,
                type: CircleType.quarterPart,
                items: itemsActionBar,
                buttonColor: Colors.transparent,
                buttonIcon: Icons.no_encryption,
                duration: Duration(milliseconds: 500),
              ))
        ],
      ),
    );
  }
}
