import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class TextingScreen extends StatefulWidget {
  final String title;
  const TextingScreen(@required this.title, {Key? key}) : super(key: key);

  @override
  _TextScreenState createState() => _TextScreenState();
}

class _TextScreenState extends State<TextingScreen> {

  var subscription;
  @override
  initState() {
    super.initState();

    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
     if(result ==ConnectivityResult.none){
       print('Non');
     }else{
       print('connect');
     }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Text(widget.title),
      ),
    );
  }
}
