import 'dart:convert';

import 'package:app/Models/Shared/translation.dart';
import 'package:app/Utilities/logger.dart';

List<FaqsModel> faqsDataFromJson(String str) =>
    List<FaqsModel>.from(json.decode(str).map((x) => FaqsModel.fromJson(x)));
String faqsDataToJson(List<FaqsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FaqsModel {
  TranslationData? question;
  TranslationData? answer;
  bool isExpanded = false;

  FaqsModel({
    this.question,
    this.answer,
  });

  FaqsModel.fromJson(Map<String, dynamic> json) {
    question = TranslationData.fromJson(json['question']);
    answer = TranslationData.fromJson(json['answer']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['answer'] = answer;
    return data;
  }
}
