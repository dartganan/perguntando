import 'package:perguntando/src/home/repository/home_repository.dart';
import 'package:perguntando/src/home/appbar/appbar_bloc.dart';
import 'package:perguntando/src/home/bottom/bottom_bloc.dart';
import 'package:perguntando/src/home/background/background_bloc.dart';
import 'package:perguntando/src/home/home_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:perguntando/src/home/home_page.dart';
import 'package:perguntando/src/shared/blocs/auth_bloc.dart';
import 'package:perguntando/src/shared/repositories/custom_hasura_connect.dart';

import '../app_module.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => AppbarBloc()),
        Bloc((i) => BottomBloc()),
        Bloc((i) => BackgroundBloc()),
        Bloc((i) => HomeBloc(i.get<HomeRepository>())),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => HomeRepository(i.get<CustomHasuraConnect>())),
        Dependency((i) => CustomHasuraConnect(AppModule.to.bloc<AuthBloc>())),
      ];

  @override
  Widget get view => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}
