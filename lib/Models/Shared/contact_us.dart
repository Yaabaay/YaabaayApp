class ContactModel {
  String? name;
  String? email;
  String? phone;
  String? countryCode;
  String? iso;
  String? subject;
  String? message;
  String? status;

  ContactModel(
      {this.name,
        this.email,
        this.phone,
        this.countryCode,
        this.iso,
        this.subject,
        this.message,
        this.status});

  ContactModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    countryCode = json['countryCode'];
    iso = json['iso'];
    subject = json['subject'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> res = <String, dynamic>{};
    res['name'] = name;
    res['email'] = email;
    res['phone'] = phone;
    res['countryCode'] = countryCode;
    res['iso'] = iso;
    res['subject'] = subject;
    res['message'] = message;
    res['status'] = status;
    return res;
  }
}