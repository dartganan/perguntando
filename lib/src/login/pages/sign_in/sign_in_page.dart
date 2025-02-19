import 'dart:core' as prefix0;
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:perguntando/src/app_module.dart';
import 'package:perguntando/src/home/home_module.dart';
import 'package:perguntando/src/shared/blocs/auth_bloc.dart';
import 'package:perguntando/src/shared/models/user_state.dart';

import 'package:validators/validators.dart' as validators;

import '../../login_bloc.dart';
import '../../login_module.dart';
import 'sign_in_bloc.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var bloc = LoginModule.to.getBloc<SignInBloc>();
  final loginBloc = LoginModule.to.bloc<LoginBloc>();
  final authBloc = AppModule.to.bloc<AuthBloc>();
  final _keyButton = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authBloc.outUser.listen((v) {
      if (v != null)
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomeModule(),
          ),
        );
    });
    authBloc.inUserState.add(NotAuthenticated());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(25),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset("assets/logo.png"),
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
                    FittedBox(
                      child: Text(
                        "Perguntando",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
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
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
                key: bloc.formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        validator: (v) {
                          if (v.isEmpty) {
                            return 'O campo não pode ser vazio';
                          } else if (!validators.isEmail(v)) {
                            return 'O email não é válido';
                          }
                          return null;
                        },
                        onSaved: (v) {
                          bloc.email = v;
                        },
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
                          hintText: "email",
                          hintStyle: TextStyle(
                                       color: Color(0xffA7A7A7),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        validator: (v) {
                          if (v.isEmpty) {
                            return 'O campo não pode ser vazio';
                          } else if (v.length < 4) {
                            return 'Senha muito curta';
                          }
                          return null;
                        },
                        onSaved: (v) {
                          bloc.password = v;
                        },
                        maxLines: 1,
                        style: TextStyle(
                          color: Color(0xffA7A7A7),
                        ),
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
                          hintText: "password",
                          hintStyle: TextStyle(
                                       color: Color(0xffA7A7A7),
                          ),
                        ),
                        obscureText: true,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: () {
                         
                        },
                        child: Text(
                          "esqueci minha senha",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: Color(0xffA7A7A7),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    StreamBuilder<AuthState>(
                        stream: authBloc.outUserState,
                        builder: (context, snapshot) {
                          if (snapshot.data is Error) {
                            return SizedBox(
                              height: 50,
                              child: Center(
                                child: Text(
                                  'Erro na autenticação',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            );
                          }
                          return SizedBox(
                            height: 50,
                          );
                        }),
                    Container(
                      height: 46,
                      child: StreamBuilder<AuthState>(
                          stream: authBloc.outUserState,
                          initialData: NotAuthenticated(),
                          builder: (context, snapshot) {
                            if (snapshot.data is Loading) {
                              return _buttonEnter(true);
                            }
                            return _buttonEnter(false);
                          }),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: GestureDetector(
                        onTap: () {
                          loginBloc.pageController.animateToPage(1,
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.bounceOut);
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonEnter(bool isLoading) {
    return AnimatedContainer(
      key: _keyButton,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(40)),
      height: 30,
      width: isLoading ? 48 : 150,
      alignment: Alignment.center,
      child: InkWell(
        onTap: bloc.onLogin,
        child: !isLoading
            ? Text(
                "ENTRAR",
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )
            : Padding(
                padding: EdgeInsets.all(10),
                child:
                    CircularProgressIndicator(backgroundColor: Colors.white)),
      ),
    );
  }
}
