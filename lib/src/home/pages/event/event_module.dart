import 'package:perguntando/src/home/pages/event/event_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:perguntando/src/home/pages/event/event_page.dart';
import 'package:perguntando/src/shared/models/event/event_model.dart';

class EventModule extends ModuleWidget {
  final EventModel model;

  EventModule(this.model);

  @override
  List<Bloc> get blocs => [
        Bloc((i) => EventBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => EventPage(
        eventModel: model,
      );

  static Inject get to => Inject<EventModule>.of();
}
