import 'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double size;
  CustomAppBar(this.size);

  @override
  Size get preferredSize => Size.fromHeight(size);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        margin: const EdgeInsets.only(top: 15, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.blue[800]),
              onPressed: () => Navigator.pop(context),
            ),
            CircleAvatar(
              radius: 25,
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Jacob Moura",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.6,
                          color: Colors.grey),
                    ),
                    Text(
                      "Nunca diga não para o seu designer",
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "10:00",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}