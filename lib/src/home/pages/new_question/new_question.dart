
import 'package:flutter/material.dart';
class NewQuestionPage extends StatefulWidget {
  @override
  _NewQuestionPageState createState() => _NewQuestionPageState();
}

class _NewQuestionPageState extends State<NewQuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.blue[800]),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Nova pergunta",
          style: TextStyle(color: Colors.grey, fontSize: 16.5),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 15, left: 10),
        child: TextField(
          decoration: InputDecoration.collapsed(
            hintText: "Digite a sua pergunta aqui...",
            hintStyle: TextStyle(color: Colors.blue[800]),
          ),
          maxLines: null,
        ),
      ),
      floatingActionButton: Hero(
        
        tag: "a",
        child: Container(
          height: 60,
          alignment: Alignment.center,
          child: Icon(Icons.add, size: 40, color: Colors.white),
          color: Colors.blue[800],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
