/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class SliderItem {
  String? id;
  String? image;
  String? title;
  String? description;
  int? sort;

  SliderItem({this.id, this.image, this.title, this.description, this.sort});

  SliderItem.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['image'] = image;
    data['title'] = title;
    data['description'] = description;
    data['sort'] = sort;
    return data;
  }
}

class SliderData {
  List<SliderItem>? data;

  SliderData({this.data});

  SliderData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SliderItem>[];
      json['data'].forEach((v) {
        data!.add(SliderItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> response = Map<String, dynamic>();
    response['data'] = data != null ? data!.map((v) => v.toJson()).toList() : null;
    return response;
  }
}

