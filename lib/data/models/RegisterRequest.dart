class RegisterRequest {
  int? id;
  String? name;
  String? type;
  String? documentPhoto;
  String? status;
  String? phoneNumber;
  String? address;
  int? userId;
  User? user;

  RegisterRequest(
      {this.id,
      this.name,
      this.type,
      this.documentPhoto,
      this.status,
      this.phoneNumber,
      this.address,
      this.userId,
      this.user});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    documentPhoto = json['document_photo'];
    status = json['status'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    userId = json['user_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['document_photo'] = this.documentPhoto;
    data['status'] = this.status;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['user_id'] = this.userId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;

  User({this.id, this.name});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
