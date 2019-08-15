import 'package:flutter/material.dart';
import 'package:perguntando/src/home/pages/question/components/question_card.dart';
import 'package:perguntando/src/home/pages/question/components/custom_appbar.dart';
import 'package:perguntando/src/home/pages/new_question/new_question.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(80),
      body: ListView.builder(
        padding: EdgeInsets.only(bottom: 80),
        itemCount: 3,
        itemBuilder: (context, i) => QuestionCard(),
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
              pageBuilder: (context, go, back) => NewQuestionPage(),
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
