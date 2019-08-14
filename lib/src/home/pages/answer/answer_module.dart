import 'package:perguntando/src/home/pages/answer/answer_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:perguntando/src/home/pages/answer/answer_page.dart';

class AnswerModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => AnswerBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => AnswerPage();

  static Inject get to => Inject<AnswerModule>.of();
}
