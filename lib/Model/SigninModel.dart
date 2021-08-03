import 'dart:convert';

SignInModel signInModelFromJson(Map<String, dynamic> json) =>
    SignInModel.fromJson(json);

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  SignInModel({
    this.customerAccessTokenCreate,
  });

  CustomerAccessTokenCreate? customerAccessTokenCreate;

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        customerAccessTokenCreate: CustomerAccessTokenCreate.fromJson(
            json["customerAccessTokenCreate"]),
      );

  Map<String, dynamic> toJson() => {
        "customerAccessTokenCreate": customerAccessTokenCreate!.toJson(),
      };
}

class CustomerAccessTokenCreate {
  CustomerAccessTokenCreate({
    this.customerAccessToken,
    this.customerUserErrors,
  });

  CustomerAccessToken? customerAccessToken;
  List<CustomerUserError>? customerUserErrors;

  factory CustomerAccessTokenCreate.fromJson(Map<String, dynamic> json) =>
      CustomerAccessTokenCreate(
        customerAccessToken: json["customerAccessToken"] == null
            ? null
            : CustomerAccessToken.fromJson(json["customerAccessToken"]),
        customerUserErrors: json["customerUserErrors"] == null
            ? null
            : List<CustomerUserError>.from(json["customerUserErrors"]
                .map((x) => CustomerUserError.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "customerAccessToken": customerAccessToken!.toJson(),
        "customerUserErrors": customerUserErrors == null
            ? null
            : List<dynamic>.from(customerUserErrors!.map((x) => x.toJson())),
      };
}

class CustomerAccessToken {
  CustomerAccessToken({
    this.accessToken,
    this.expiresAt,
  });

  String? accessToken;
  DateTime? expiresAt;

  factory CustomerAccessToken.fromJson(Map<String, dynamic> json) =>
      CustomerAccessToken(
        accessToken: json["accessToken"],
        expiresAt: DateTime.parse(json["expiresAt"]),
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "expiresAt": expiresAt!.toIso8601String(),
      };
}

class CustomerUserError {
  CustomerUserError({
    this.code,
    this.field,
    this.message,
  });

  String? code;
  dynamic? field;
  String? message;

  factory CustomerUserError.fromJson(Map<String, dynamic> json) =>
      CustomerUserError(
        code: json["code"],
        field: json["field"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "field": field,
        "message": message,
      };
}
