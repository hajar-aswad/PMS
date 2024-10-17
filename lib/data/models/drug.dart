class Drug {
  int? id;
  String? brandName;
  String? scientificName;
  String? capacity;
  String? titer;
  String? contraindications;
  String? sideEffects;
  int? isPrescription;
  Category? category;
  Category? dosageForm;//TODO 
  Category? manufactureCompany;
  List<Category>? indications;
  List<Category>? scientificMaterials;
  List<Category>? therapeuticEffects;

  Drug(
      {this.id,
      this.brandName,
      this.scientificName,
      this.capacity,
      this.titer,
      this.contraindications,
      this.sideEffects,
      this.isPrescription,
      this.category,
      this.dosageForm,
      this.manufactureCompany,
      this.indications,
      this.scientificMaterials,
      this.therapeuticEffects});

  Drug
.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandName = json['brand_name'];
    scientificName = json['scientific_name'];
    capacity = json['capacity'];
    titer = json['titer'];
    contraindications = json['contraindications'];
    sideEffects = json['side_effects'];
    isPrescription = json['is_prescription'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    dosageForm = json['dosage_form'] != null
        ? new Category.fromJson(json['dosage_form'])
        : null;
    manufactureCompany = json['manufacture_company'] != null
        ? new Category.fromJson(json['manufacture_company'])
        : null;
    if (json['indications'] != null) {
      indications = <Category>[];
      json['indications'].forEach((v) {
        indications!.add(new Category.fromJson(v));
      });
    }
    if (json['scientific_materials'] != null) {
      scientificMaterials = <Category>[];
      json['scientific_materials'].forEach((v) {
        scientificMaterials!.add(new Category.fromJson(v));
      });
    }
    if (json['therapeutic_effects'] != null) {
      therapeuticEffects = <Category>[];
      json['therapeutic_effects'].forEach((v) {
        therapeuticEffects!.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand_name'] = this.brandName;
    data['scientific_name'] = this.scientificName;
    data['capacity'] = this.capacity;
    data['titer'] = this.titer;
    data['contraindications'] = this.contraindications;
    data['side_effects'] = this.sideEffects;
    data['is_prescription'] = this.isPrescription;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.dosageForm != null) {
      data['dosage_form'] = this.dosageForm!.toJson();
    }
    if (this.manufactureCompany != null) {
      data['manufacture_company'] = this.manufactureCompany!.toJson();
    }
    if (this.indications != null) {
      data['indications'] = this.indications!.map((v) => v.toJson()).toList();
    }
    if (this.scientificMaterials != null) {
      data['scientific_materials'] =
          this.scientificMaterials!.map((v) => v.toJson()).toList();
    }
    if (this.therapeuticEffects != null) {
      data['therapeutic_effects'] =
          this.therapeuticEffects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  get first => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }

}
  class DosageForm {
  int? id;
  String? name;
  String? unit;
  String? type;

  DosageForm({this.id, this.name, this.unit, this.type});

  DosageForm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    unit = json['unit'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['unit'] = this.unit;
    data['type'] = this.type;
    return data;
  }
}

