import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class AnswerCard extends StatefulWidget {
  @override
  _AnswerCardState createState() => _AnswerCardState();
}

class _AnswerCardState extends State<AnswerCard> {
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

class NewAnswerPage extends StatefulWidget {
  @override
  _NewAnswerPageState createState() => _NewAnswerPageState();
}

class _NewAnswerPageState extends State<NewAnswerPage> {
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
