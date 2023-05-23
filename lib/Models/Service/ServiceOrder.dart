class ServiceOrder {
  String? categoryId;
  String? categoryName;
  String? notes;
  String? userId;
  String? userName;
  String? userMobile;
  String? orderId;

  ServiceOrder(
      {this.categoryId,
        this.categoryName,
        this.notes,
        this.userId,
        this.userName,
        this.userMobile,
        this.orderId});

  ServiceOrder.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    notes = json['notes'];
    userId = json['userId'];
    userName = json['userName'];
    userMobile = json['userMobile'];
    orderId = json['orderId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryId'] = categoryId;
    data['categoryName'] = categoryName;
    data['notes'] = notes;
    data['userId'] = userId;
    data['userName'] = userName;
    data['userMobile'] = userMobile;
    data['orderId'] = orderId;
    return data;
  }
}