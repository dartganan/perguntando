import 'package:perguntando/src/app_module.dart';
import 'package:perguntando/src/login/pages/page_login/page_login_bloc.dart';
import 'package:perguntando/src/login/pages/page_register/page_register_bloc.dart';
import 'package:perguntando/src/login/login_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:perguntando/src/login/login_page.dart';
import 'package:perguntando/src/repository/hasura_repository.dart';
import 'package:perguntando/src/shared/blocs/auth_bloc.dart';

class LoginModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => PageLoginBloc(
              AppModule.to.bloc<AuthBloc>(),
              i.get<HasuraRepository>(),
            )),
        Bloc((i) => PageRegisterBloc(
            )),
        Bloc((i) => LoginBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => AppModule.to.get<HasuraRepository>()),
      ];

  @override
  Widget get view => LoginPage();

  static Inject get to => Inject<LoginModule>.of();
}
