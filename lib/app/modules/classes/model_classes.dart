class ModelClasses extends Comparable {
  String? id;
  String? company_id;
  int? created_at;
  String? name;
  String? status;
  dynamic summary;

  ModelClasses({this.id, this.company_id, this.created_at, this.name, this.status, this.summary});

  ModelClasses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company_id = json['company_id'];
    created_at = json['created_at'];
    name = json['name'];
    status = json['status'];
    summary = json['summary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_id'] = this.company_id;
    data['created_at'] = this.created_at;
    data['name'] = this.name;
    data['status'] = this.status;
    data['summary'] = this.summary;
    return data;
  }

  @override
  int compareTo(other) {
    var result;

    if (this.created_at! < other.created_at!) {
      result = -1;
    }

    if (this.created_at! > other.created_at!) {
      result =  1;
    }

    if (this.created_at! == other.created_at!) {
      result =  0;
    }

    return result;

  }
}
