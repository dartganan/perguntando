import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:perguntando/src/shared/models/event_model.dart';

class HomeRepository extends Disposable {
 
   final HasuraConnect conn;

  HomeRepository(this.conn);

  Stream<List<EventModel>> getEvents() {
    var query = '''subscription {
                      event(where: {info_status: {_eq: true}}, order_by: {info_date: asc}) {
                        id_event
                        name
                        description
                        url_photo
                        color
                        info_date
                        info_status
                        city
                        state
                        location
                      }
                    }''';
    try {
      Snapshot snapshot = conn.subscription(query);
      return snapshot.stream.map(
        (json) => EventModel.fromJsonList(json['data']['event']),
      );
    } on HasuraError catch (e) {     
      print(e);
      print(e.extensions);    
      return null;
    }  
  }
  
  @override
  void dispose() {}
}
