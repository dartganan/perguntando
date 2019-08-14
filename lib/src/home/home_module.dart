import 'package:perguntando/src/home/appbar/appbar_bloc.dart';
import 'package:perguntando/src/home/bottom/bottom_bloc.dart';
import 'package:perguntando/src/home/card/card_bloc.dart';
import 'package:perguntando/src/home/background/background_bloc.dart';
import 'package:perguntando/src/home/home_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:perguntando/src/home/home_page.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => AppbarBloc()),
        Bloc((i) => BottomBloc()),
        Bloc((i) => CardBloc()),
        Bloc((i) => BackgroundBloc()),
        Bloc((i) => HomeBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}
