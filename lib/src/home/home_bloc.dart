import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:perguntando/src/shared/models/event/event_model.dart';
import 'package:rxdart/rxdart.dart';

import 'repository/home_repository.dart';

class HomeBloc extends BlocBase {
  final HomeRepository _repository;

  HomeBloc(this._repository) {
    eventsStream = Observable(_repository.getEvents());
  }

  Observable<List<EventModel>> eventsStream;

  @override
  void dispose() {
    super.dispose();
  }
}
