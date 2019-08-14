import 'package:flutter/material.dart';
import 'package:perguntando/src/home/pages/answer/components/answer_card.dart';
import 'package:perguntando/src/home/pages/answer/components/custom_appbar.dart';
import 'package:perguntando/src/home/pages/answer/components/custom_drawer.dart';
import 'package:perguntando/src/home/pages/new_answer/new_answer.dart';

class AnswerPage extends StatefulWidget {
  @override
  _AnswerPageState createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: CustomAppBar(80),
      body: ListView.builder(
        padding: EdgeInsets.only(bottom: 80),
        itemCount: 3,
        itemBuilder: (context, i) => AnswerCard(),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "a",
        child: Icon(
          Icons.add,
          size: 28,
        ),
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 500),
              pageBuilder: (context, go, back) => NewAnswerPage(),
              transitionsBuilder: (context, go, back, widget) => FadeTransition(
                opacity: go,
                child: widget,
              ),
            ),
          );
        },
      ),
    );
  }
}
