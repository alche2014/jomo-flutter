import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:jomo_flutter/Utils/Commons.dart';
import 'package:jomo_flutter/Utils/ConnectionObserver.dart';

class InternetWidget extends StatefulWidget {
  final Widget child;

  const InternetWidget({Key? key, required this.child}) : super(key: key);

  @override
  _InternetWidgetState createState() => _InternetWidgetState();
}

class _InternetWidgetState extends State<InternetWidget> {
  ConnectivityStatus? observer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ConnectionObserver.instance!
        .checkInternet()
        .then((value) => observer = value!);
  }

  @override
  Widget build(BuildContext context) {
    return observer == ConnectivityStatus.Offline
        ? Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/wishlistbg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 120),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Internet Connection Issue',
                      style: TextStyle(
                          fontFamily: 'nu_bold',
                          fontSize: 16,
                          color: Commons.textColor),
                    ),
                  ],
                ),
              ),
            ))
        : widget.child;
  }
}
