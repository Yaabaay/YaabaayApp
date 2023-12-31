import 'dart:convert';

import 'package:app/Models/Shared/translation.dart';

List<ServicesData> servicesDataFromJson(String str) => List<ServicesData>.from(
    json.decode(str).map((x) => ServicesData.fromJson(x)));
String servicesDataToJson(List<ServicesData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServicesData {
  ServicesData({
    this.sub,
    this.id,
    this.name,
    this.desc,
    this.subs,
    this.background,
    this.logo,
  });

  String? sub;
  String? id;
  TranslationData? name;
  TranslationData? desc;
  List<ServicesData>? subs;
  String? background;
  String? logo;

  factory ServicesData.fromJson(Map<String, dynamic> json) => ServicesData(
        sub: json["sub"] == null ? null : json["sub"],
        id: json["_id"],
        name: TranslationData.fromJson(json["name"]),
        desc: TranslationData.fromJson(json["desc"]),
        subs: List<ServicesData>.from(
            json["subs"].map((x) => ServicesData.fromJson(x))),
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
