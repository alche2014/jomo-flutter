
import 'package:jomo_flutter/Model/LoginCheckModel.dart';
import 'package:jomo_flutter/Model/UserModel.dart';
import 'package:jomo_flutter/Utils/prefManager.dart';

Future<LoginCheckModel> getLoginInfo() async {
  bool isLogin = await MySharedPreferences.instance.getBoolValue("isLogin");
  String login_expireDate = await MySharedPreferences.instance.getStringValue("expireAt");
  if (!isLogin) {
    return LoginCheckModel(isLogin: false);
  } else {
    if(DateTime.parse(login_expireDate).isBefore(DateTime.now())){
      expireToken();
      return LoginCheckModel(isLogin: false);
    }else {
      String customer_id =
      await MySharedPreferences.instance.getStringValue("id");
      String customer_email =
      await MySharedPreferences.instance.getStringValue("email");
      String customer_display =
      await MySharedPreferences.instance.getStringValue("displayname");
      String customer_fname =
      await MySharedPreferences.instance.getStringValue("fname");
      String customer_lname =
      await MySharedPreferences.instance.getStringValue("lname");
      String customer_phone =
      await MySharedPreferences.instance.getStringValue("phone");
      String login_accessToken =
      await MySharedPreferences.instance.getStringValue("accessToken");

      return LoginCheckModel(
          isLogin: true,
          userModel: new Customer(id: customer_id,firstName: customer_fname,lastName: customer_lname,phone: customer_phone,email: customer_email,displayName: customer_display),
          expireAt: login_expireDate,
          accessToken: login_accessToken);
    }
  }
}

expireToken() async {
  MySharedPreferences.instance.setBoolValue('isLogin',false);
  MySharedPreferences.instance.removeValue('accessToken');
  MySharedPreferences.instance.removeValue('expireAt');
  MySharedPreferences.instance.removeValue('id');
  MySharedPreferences.instance.removeValue('email');
  MySharedPreferences.instance.removeValue('fname');
  MySharedPreferences.instance.removeValue('lname');
  MySharedPreferences.instance.removeValue('displayname');
  MySharedPreferences.instance.removeValue('phone');
  MySharedPreferences.instance.removeValue('accessToken');
}
