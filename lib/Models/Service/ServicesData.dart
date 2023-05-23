import 'dart:convert';

List<ServicesData> servicesDataFromJson(String str) => List<ServicesData>.from(json.decode(str).map((x) => ServicesData.fromJson(x)));
String servicesDataToJson(List<ServicesData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServicesData {
  ServicesData({
    this.sub,
    this.id,
    this.name,
    this.subs,
    this.desc,
    this.background,
    this.logo,
  });

  String? sub;
  String? id;
  String? name;
  List<ServicesData>? subs;
  String? desc;
  String? background;
  String? logo;

  factory ServicesData.fromJson(Map<String, dynamic> json) => ServicesData(
    sub: json["sub"] == null ? null : json["sub"],
    id: json["_id"],
    name: json["name"],
    subs: List<ServicesData>.from(json["subs"].map((x) => ServicesData.fromJson(x))),
    desc: json["desc"],
    background: json["background"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "sub": sub == null ? null : sub,
    "_id": id,
    "name": name,
    "subs": List<dynamic>.from(subs!.map((x) => x.toJson())),
    "desc": desc,
    "background": background,
    "logo": logo,
  };
}
