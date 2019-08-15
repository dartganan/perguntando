
import 'package:flutter/material.dart';

class QuestionCard extends StatefulWidget {
  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(10),
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                  left: 18, right: 18, bottom: 6, top: 18),
              child: Column(children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 13),
                      child: GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: CircleAvatar(
                          radius: 23,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text("Rully Alves"),
                        ),
                        Text("há alguns segundos")
                      ],
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 13, bottom: 8),
                  child: Text(
                    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaa aaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaa aaaaaaaaaaaaa",
                    softWrap: true,
                  ),
                ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.only(right: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      "EXCLUIR",
                      style: TextStyle(color: Colors.red[300]),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "200",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                          size: 35,
                        ),
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


