class Admin {
  String? name;
  String? email;
  String? photo;
  String? token;

  Admin({this.name, this.email, this.photo, this.token});

  Admin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    photo = json['photo'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['photo'] = this.photo;
    data['token'] = this.token;
    return data;
  }
}
