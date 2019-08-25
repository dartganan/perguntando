import 'package:perguntando/src/shared/utils/date_utils.dart';

import 'presenter_model.dart';

class LectureModel {
  int idLecture;
  String title;
  String description;
  String infoDate;
  int idEvent;
  PresenterModel presenter;

  LectureModel(
      {this.idLecture,
      this.title,
      this.description,
      this.infoDate,
      this.idEvent,
      this.presenter});

     

  LectureModel.fromJson(Map<String, dynamic> json) {
    idLecture = json['id_lecture'];
    title = json['title'];
    description = json['description'];
    infoDate = format(DateTime.tryParse(json['info_date']),'dd/MM/yyyy');
    idEvent = json['id_event'];
    presenter = json['presenter'] != null
        ? new PresenterModel.fromJson(json['presenter'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_lecture'] = this.idLecture;
    data['title'] = this.title;
    data['description'] = this.description;
    data['info_date'] = this.infoDate;
    data['id_event'] = this.idEvent;
    if (this.presenter != null) {
      data['presenter'] = this.presenter.toJson();
    }
    return data;
  }
  static List<LectureModel> fromJsonList(List list) {
    if (list == null) return null;
    return list.map<LectureModel>((item) => LectureModel.fromJson(item)).toList();
  }

  @override
  String toString() {
    return '${this.toJson()}';
  }
}