import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox.fromSize(
      size: Size(220, height),
      child: Drawer(
        child: Container(
          padding: EdgeInsets.zero,
          color: Colors.blue[800],
          child: Column(
            children: <Widget>[
              Container(
                height: 370,
                child: Column(
                  children: <Widget>[
                    UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blue[800],
                      ),
                      accountName: Text(
                        "Rully Alves",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      accountEmail: Text("rullyalvesz@gmail.com"),
                      currentAccountPicture: CircleAvatar(
                        minRadius: 10,
                        maxRadius: 15,
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 35,
                      ),
                      title: Text(
                        "EDITAR CONTA",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.event_available,
                        color: Colors.white,
                        size: 35,
                      ),
                      title: Text(
                        "EVENTOS",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                height: 50,
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.transit_enterexit,
                    color: Colors.black,
                    size: 35,
                  ),
                  title: Text(
                    "SAIR",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
