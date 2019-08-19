import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:perguntando/src/shared/models/event/event_model.dart';
import 'package:rxdart/rxdart.dart';

import 'repository/home_repository.dart';

class HomeBloc extends BlocBase {
  final HomeRepository repository;
  HomeBloc(this.repository);

  Observable<List<EventModel>> get eventsStream => Observable(repository.getEvents());

  @override
  void dispose() {
    super.dispose();
  }
}
