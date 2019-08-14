class UserModel {
  int idUser;
  String name;
  String email;
  String password;
  String infoDate;
  String photo;
  String githubUser;

  UserModel(
      {this.idUser,
      this.name,
      this.email,
      this.password,
      this.infoDate,
      this.photo,
      this.githubUser});

  UserModel.fromJson(Map<String, dynamic> json) {
    idUser = json['id_user'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    infoDate = json['info_date'];
    photo = json['photo'];
    githubUser = json['github_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_user'] = this.idUser;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['info_date'] = this.infoDate;
    data['photo'] = this.photo;
    data['github_user'] = this.githubUser;
    return data;
  }


  @override
  String toString() {
    return '${this.toJson()}';
  }
}