class TypeAndUnit {
  List<Units>? units;
  List<Types>? types;

  TypeAndUnit({this.units, this.types});

  TypeAndUnit.fromJson(Map<String, dynamic> json) {
    if (json['units'] != null) {
      units = <Units>[];
      json['units'].forEach((v) {
        units!.add(new Units.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(new Types.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.units != null) {
      data['units'] = this.units!.map((v) => v.toJson()).toList();
    }
    if (this.types != null) {
      data['types'] = this.types!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Units {
  String? unit;

  Units({this.unit});

  Units.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit'] = this.unit;
    return data;
  }
}

class Types {
  String? type;

  Types({this.type});

  Types.fromJson(Map<String, dynamic> json) {
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    return data;
  }
}
