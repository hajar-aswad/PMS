class Pharmacy {
  int? id;
  String? name;
  String? phoneNumber;
  String? address;

  Pharmacy({this.id, this.name, this.phoneNumber, this.address});

  Pharmacy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    return data;
  }
}
