import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:perguntando/src/shared/models/event/event_model.dart';

class HomeRepository extends Disposable {
  final HasuraConnect _conn;

  HomeRepository(this._conn);
  Snapshot snapshot;

  Stream<List<EventModel>> getEvents() {
    var query = '''subscription {
                      event(where: {info_status: {_eq: true}}, order_by: {info_date: asc}) {
                        id_event
                        title
                        description
                        url_photo
                        color
                        info_date
                        info_status
                        city
                        state
                        location
                        lectures{
                          id_lecture
                          title
                          description
                          info_date
                          presenter {
                            name
                            photo
                          }
                        }
                      }
                    }''';
    try {
      snapshot = _conn.subscription(query);
      return snapshot.stream.map(
        (json) => EventModel.fromJsonList(json['data']['event']),
      );
    } on HasuraError catch (e) {
      print('LOGX ==:>> ERROR[getEvents]');
      print(e);
      print(e.extensions);
      print('=================');
      return null;
    }
  }

  @override
  void dispose() {
    snapshot.close();
  }
}
