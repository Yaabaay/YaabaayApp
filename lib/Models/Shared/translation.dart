import 'package:get/get.dart';

class TranslationData {
  String? en;
  String? fr;
  String? tr;
  String? ar;

  TranslationData({
    this.en,
    this.fr,
    this.tr,
    this.ar,
  });

  TranslationData.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    fr = json.containsKey('fr') && json['fr'] != null ? json['fr'] : json['en'];
    tr = json.containsKey('tr') && json['tr'] != null ? json['tr'] : json['en'];
    ar = json.containsKey('ar') && json['ar'] != null ? json['ar'] : json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    data['fr'] = this.fr;
    data['tr'] = this.tr;
    data['ar'] = this.ar;
    return data;
  }

  dynamic getTran() => <String, dynamic>{
        'en': this.en,
        'fr': this.fr,
        'tr': this.tr,
        'ar': this.ar,
      }[Get.locale?.languageCode ?? 'en']
          .toString();
}
