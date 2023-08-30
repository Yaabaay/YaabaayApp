class CustomerModel {
  String? customers;
  String? resellerCode;

  CustomerModel({this.customers, this.resellerCode});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    customers = json['customers'];
    resellerCode = json['resellerCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customers'] = this.customers;
    data['resellerCode'] = this.resellerCode;
    return data;
  }
}
