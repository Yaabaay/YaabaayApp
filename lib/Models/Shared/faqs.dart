import 'dart:convert';

List<FaqsModel> faqsDataFromJson(String str) => List<FaqsModel>.from(json.decode(str).map((x) => FaqsModel.fromJson(x)));
String faqsDataToJson(List<FaqsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FaqsModel {
  String? question;
  String? answer;
  bool isExpanded = false;

  FaqsModel({this.question, this.answer,});

  FaqsModel.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['answer'] = answer;
    return data;
  }
}