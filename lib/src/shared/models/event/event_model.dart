import 'package:perguntando/src/shared/models/event/lecture_model.dart';

class EventModel {
  int idEvent;
  String title;
  String description;
  String urlPhoto;
  String color;
  DateTime infoDate;
  bool infoStatus;
  String city;
  String state;
  String location;
  List<LectureModel> lectures;

  EventModel(
      {this.idEvent,
      this.title,
      this.description,
      this.urlPhoto,
      this.color,
      this.infoDate,
      this.infoStatus,
      this.city,
      this.state,
      this.location,
      this.lectures});

  EventModel.fromJson(Map<String, dynamic> json) {
    idEvent = json['id_event'];
    title = json['title'];
    description = json['description'];
    urlPhoto = json['url_photo'];
    color = json['color'];
    infoDate = DateTime.tryParse(json['info_date']);
    infoStatus = json['info_status'];
    city = json['city'];
    state = json['state'];
    location = json['location'];
    if (json['lectures'] != null) {
      lectures = new List<LectureModel>();
      json['lectures'].forEach((v) {
        lectures.add(new LectureModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_event'] = this.idEvent;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url_photo'] = this.urlPhoto;
    data['color'] = this.color;
    data['info_date'] = this.infoDate.toString();
    data['info_status'] = this.infoStatus;
    data['city'] = this.city;
    data['state'] = this.state;
    data['location'] = this.location;
    if (this.lectures != null) {
      data['lectures'] = this.lectures.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static List<EventModel> fromJsonList(List list) {
    if (list == null) return null;
    return list.map<EventModel>((item) => EventModel.fromJson(item)).toList();
  }

  @override
  String toString() {
    return '${this.toJson()}';
  }
}
