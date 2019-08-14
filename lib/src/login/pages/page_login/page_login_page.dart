import 'package:flutter/material.dart';

class PageLoginPage extends StatefulWidget {
  @override
  _PageLoginPageState createState() => _PageLoginPageState();
}

class _PageLoginPageState extends State<PageLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("Login"),
      ),
    );
  }
}
