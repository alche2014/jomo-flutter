import 'dart:convert';

SignUpModel signUpModelFromJson(Map<String, dynamic> json) => SignUpModel.fromJson(json);

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    this.customerCreate,
  });

  CustomerCreate? customerCreate;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    customerCreate: CustomerCreate.fromJson(json["customerCreate"]),
  );

  Map<String, dynamic> toJson() => {
    "customerCreate": customerCreate!.toJson(),
  };
}

class CustomerCreate {
  CustomerCreate({
    this.customer,
    this.customerUserErrors,
  });

  Customer? customer;
  List<CustomerUserError>? customerUserErrors;

  factory CustomerCreate.fromJson(Map<String, dynamic> json) => CustomerCreate(
    customer: json["customer"],
    customerUserErrors: List<CustomerUserError>.from(json["customerUserErrors"].map((x) => CustomerUserError.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "customer": customer,
    "customerUserErrors": List<dynamic>.from(customerUserErrors!.map((x) => x.toJson())),
  };
}

class Customer {
  Customer({
    this.id,
    this.firstName,
  });

  String? id;
  String? firstName;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"],
    firstName: json["firstName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
  };
}

class CustomerUserError {
  CustomerUserError({
    this.field,
    this.message,
  });

  List<String>? field;
  String? message;

  factory CustomerUserError.fromJson(Map<String, dynamic> json) => CustomerUserError(
    field:json["field"] == null ? null : List<String>.from(json["field"].map((x) => x)),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "field": field == null ? null : List<dynamic>.from(field!.map((x) => x)),
    "message": message,
  };
}

