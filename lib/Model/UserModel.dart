class UserModel {
  Customer? customer;

  UserModel({this.customer});

  UserModel.fromJson(Map<String, dynamic> json) {
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}

class Customer {
  String? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? displayName;

  Customer(
      {this.id,
      this.firstName,
      this.lastName,
      this.phone,
      this.email,
      this.displayName});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'] != null ? json['firstName'] : '';
    lastName = json['lastName'];
    phone = json['phone'];
    email = json['email'];
    displayName = json['displayName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['displayName'] = this.displayName;
    return data;
  }
}
