import 'package:flutter/material.dart';
import 'package:perguntando/src/home/home_module.dart';
import 'package:perguntando/src/shared/models/user_state.dart';

import 'app_module.dart';
import 'login/login_module.dart';
import 'shared/blocs/auth_bloc.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = AppModule.to.bloc<AuthBloc>();

    return MaterialApp(
      title: 'Perguntando',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF1565C0),
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: StreamBuilder<AuthState>(
          stream: bloc.outUserState,
          builder: (context, snapshot) {
            if (snapshot.data is Authenticated) {
              return HomeModule();
            }
            return LoginModule();
          }), //LoginModule(),
    );
  }
}
