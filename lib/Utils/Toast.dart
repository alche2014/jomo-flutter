import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowToast {
  static showToastInBottam(BuildContext context, String message, {Color? bgColor, Color txtColor = Colors.white, double fontSize = 12.0}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: bgColor ?? Colors.black.withOpacity(0.5),
      textColor: txtColor,
      fontSize: fontSize,
    );
  }

  static showToastInCenter(BuildContext context, String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black.withOpacity(0.5),
      textColor: Colors.white,
      fontSize: 12.0,
    );
  }
}