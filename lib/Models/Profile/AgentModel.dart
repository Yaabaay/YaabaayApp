class AgentModel {
  String? sId;
  String? name;
  String? email;
  String? phone;
  String? iso;
  String? gender;
  String? role;
  String? active;
  String? token;
  String? createdAt;
  String? updatedAt;
  String? birthdate;
  String? countryCode;
  String? avatar;
  String? resellerCode;

  AgentModel(
      {this.sId,
      this.name,
      this.email,
      this.phone,
      this.iso,
      this.gender,
      this.role,
      this.active,
      this.token,
      this.createdAt,
      this.updatedAt,
      this.birthdate,
      this.countryCode,
      this.avatar,
      this.resellerCode});

  AgentModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    iso = json['iso'];
    gender = json['gender'];
    role = json['role'];
    active = json['active'];
    token = json['token'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    birthdate = json['birthdate'];
    countryCode = json['countryCode'];
    avatar = json['avatar'];
    resellerCode = json['resellerCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['iso'] = this.iso;
    data['gender'] = this.gender;
    data['role'] = this.role;
    data['active'] = this.active;
    data['token'] = this.token;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['birthdate'] = this.birthdate;
    data['countryCode'] = this.countryCode;
    data['avatar'] = this.avatar;
    data['resellerCode'] = this.resellerCode;
    return data;
  }
}
