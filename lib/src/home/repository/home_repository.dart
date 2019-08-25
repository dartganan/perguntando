
import 'package:hasura_connect/hasura_connect.dart';
import 'package:perguntando/src/shared/models/event/event_model.dart';

class HomeRepository {
  final HasuraConnect _conn;

  HomeRepository(this._conn);


  Future<List<EventModel>> getEvents() async{
    var query = '''query {
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
                          counter:lecture_questions_aggregate {
                          aggregate {
                           count(columns: id_lecture_question)
                          }
                         }
                        }
                      }
                    }''';
    try {
     final queryResult = await _conn.query(query);

     final result = EventModel.fromJsonList(queryResult['data']['event'] as List);
     
     

      return result;
    } on HasuraError catch (e) {
      print('LOGX ==:>> ERROR[getEvents]');
      print(e);
      print(e.extensions);
      print('=================');
      return null;
    }
  }

}
