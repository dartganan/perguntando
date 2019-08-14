import 'package:flutter/material.dart';

import '../../login_bloc.dart';
import '../../login_module.dart';

class PageRegisterPage extends StatefulWidget {
  @override
  _PageRegisterPageState createState() => _PageRegisterPageState();
}

class _PageRegisterPageState extends State<PageRegisterPage> {
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
                    "CADASTRO",
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
                        style: TextStyle(
                          color: Color(0xffA7A7A7),
                        ),
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
                          labelText: "seu nome",
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
                        style: TextStyle(
                          color: Color(0xffA7A7A7),
                        ),
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
                          labelText: "seu email",
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
                        style: TextStyle(
                          color: Color(0xffA7A7A7),
                        ),
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
                          labelText: "digita sua senha",
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
                        style: TextStyle(
                          color: Color(0xffA7A7A7),
                        ),
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
                          labelText: "senha novamente",
                          labelStyle: TextStyle(
                            color: Color(0xffA7A7A7),
                          ),
                        ),
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
                            "CADASTRAR",
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
                            bloc.pageController.animateToPage(0,duration: Duration(milliseconds: 1000), curve: Curves.bounceOut);
                        },
                        child: Text(
                          "voltar para o login",
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
