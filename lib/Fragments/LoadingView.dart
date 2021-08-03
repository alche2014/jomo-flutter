import 'package:flutter/material.dart';
class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: Center(child: CircularProgressIndicator()));
  }
}
