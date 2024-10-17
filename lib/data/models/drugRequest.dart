class DrugRequest {
  int? id;
  String? drugName;
  String? notes;
  String? date;
  String? status;
  String? repositoryId;
  String? deletedAt;

  DrugRequest(
      {this.id,
      this.drugName,
      this.notes,
      this.date,
      this.status,
      this.repositoryId,
      this.deletedAt});

  DrugRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    drugName = json['drug_name'];
    notes = json['notes'];
    date = json['date'];
    status = json['status'];
    repositoryId = json['repository_id'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['drug_name'] = this.drugName;
    data['notes'] = this.notes;
    data['date'] = this.date;
    data['status'] = this.status;
    data['repository_id'] = this.repositoryId;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
