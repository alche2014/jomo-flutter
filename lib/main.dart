import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jomo_flutter/Activities/BottamNavigationBar.dart';
import 'package:jomo_flutter/Utils/Commons.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jomo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        scaffoldBackgroundColor: Commons.backroundColor,
        colorScheme: ThemeData().colorScheme.copyWith(
            primary: Commons.themePrimaryDarkColor,
            secondary: Commons.themeAccentDarkColor
        ),
      ),
      home: BottamNavigationBar(showIndex: 0),
    );
  }
}
