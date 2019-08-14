import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../login_bloc.dart';
import '../../login_module.dart';

class PageLoginPage extends StatefulWidget {
  @override
  _PageLoginPageState createState() => _PageLoginPageState();
}

class _PageLoginPageState extends State<PageLoginPage> {
  var bloc = LoginModule.to.getBloc<LoginBloc>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
//        color: Colors.greenAccent,
        alignment: Alignment.center,
        padding: EdgeInsets.all(25),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          
          child: Column(
            children: <Widget>[
              FlutterLogo(
                size: 130,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 0,
                constraints: BoxConstraints(
                  minWidth: 230,
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Perguntando",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "by Flutterando",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 2,
                    margin: EdgeInsets.only(right: 10),
                    color: Colors.white,
                  ),
                  Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Container(
                    width: 100,
                    height: 2,
                    margin: EdgeInsets.only(left: 10),
                    color: Colors.white,
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        maxLines: 1,
                        style: TextStyle( color: Color(0xffA7A7A7),),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                          hasFloatingPlaceholder: false,
                          labelText: "email",
                          labelStyle: TextStyle(
                            color: Color(0xffA7A7A7),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        maxLines: 1,
                        style: TextStyle( color: Color(0xffA7A7A7),),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                          ),
                          hasFloatingPlaceholder: false,
                          labelText: "senha",
                          labelStyle: TextStyle(
                             color: Color(0xffA7A7A7),
                          ),
                        ),
                        obscureText: true,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 46,
                      child: RaisedButton(
                        shape: StadiumBorder(),
                        color: Colors.blue,
                        onPressed: () {},
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            "ENTRAR",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: GestureDetector(
                        onTap: ()  {
                          bloc.pageController.animateToPage(1,duration: Duration(milliseconds: 1000), curve: Curves.bounceOut);
                        },
                        child: Text(
                          "cadastre-se agora",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color(0xffA7A7A7),
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
