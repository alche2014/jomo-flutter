
import 'package:jomo_flutter/Model/UserModel.dart';

class LoginCheckModel {
  bool? _isLogin;
  String? _expireAt;
  String? _accessToken;
  Customer? _userModel;


  LoginCheckModel({Customer? userModel, bool? isLogin, String? expireAt, String? accessToken})
  :_userModel =userModel,
  _isLogin = isLogin,
  _expireAt = expireAt,
  _accessToken = accessToken
  ;

  Customer get userModel => _userModel!;

  set userModel(Customer value) {
    _userModel = value;
  }

  String get accessToken => _accessToken!;

  set accessToken(String value) {
    _accessToken = value;
  }

  String get expireAt => _expireAt!;

  set expireAt(String value) {
    _expireAt = value;
  }

  bool get isLogin => _isLogin!;

  set isLogin(bool value) {
    _isLogin = value;
  }
}
