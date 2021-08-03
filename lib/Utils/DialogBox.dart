import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

dialogBox(BuildContext context, String title, String message,
    String negativeTxt, String positiveTxt, VoidCallback onPositive) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Platform.isIOS
          ? new CupertinoAlertDialog(
              title: Text(title),
              content: Text(message),
              actions: <Widget>[
                TextButton(
                  child: new Text(
                    negativeTxt,
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: new Text(positiveTxt,
                      style: TextStyle(color: Colors.black)),
                  onPressed: () => onPositive,
                ),
              ],
            )
          : new AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: <Widget>[
                TextButton(
                  child: new Text(
                    negativeTxt,
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: new Text(positiveTxt,
                      style: TextStyle(color: Colors.black)),
                  onPressed: onPositive,
                ),
              ],
            );
    },
  );
}
