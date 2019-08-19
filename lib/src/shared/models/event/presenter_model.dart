class PresenterModel {
  String name;
  String photo;
  String email;
  String githubUser;
  int idUser;
  String infoDate;
  String password;

  PresenterModel(
      {this.name,
      this.photo,
      this.email,
      this.githubUser,
      this.idUser,
      this.infoDate,
      this.password});

  PresenterModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    photo = json['photo'];
    email = json['email'];
    githubUser = json['github_user'];
    idUser = json['id_user'];
    infoDate = json['info_date'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['email'] = this.email;
    data['github_user'] = this.githubUser;
    data['id_user'] = this.idUser;
    data['info_date'] = this.infoDate;
    data['password'] = this.password;
    return data;
  }

    static List<PresenterModel> fromJsonList(List list) {
    if (list == null) return null;
    return list.map<PresenterModel>((item) => PresenterModel.fromJson(item)).toList();
  }

  @override
  String toString() {
    return '${this.toJson()}';
  }
}