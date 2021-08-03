import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jomo_flutter/Activities/AccountScreen.dart';
import 'package:jomo_flutter/Activities/HomeScreen.dart';
import 'package:jomo_flutter/Activities/StoreScreen.dart';
import 'package:jomo_flutter/Fragments/testing.dart';
import 'package:jomo_flutter/Utils/Commons.dart';
import 'package:flutter/services.dart';

class BottamNavigationBar extends StatefulWidget {
  final int? showIndex;

  BottamNavigationBar({@required this.showIndex}) : assert(showIndex != null);

  @override
  _BottamNavigationBarState createState() => _BottamNavigationBarState();
}

class _BottamNavigationBarState extends State<BottamNavigationBar> {
  DateTime now = DateTime.now();
  int? index;

  _BottamNavigationBarState();

  @override
  void initState() {
    index = widget.showIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: false,
          child: Center(
            child: _showScreen(index!),
          )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index!,
        onTap: (int index) {
          setState(() {
            this.index = index;
          });
        },
        elevation: 20,
        backgroundColor: Commons.backroundColor,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.store_mall_directory_outlined), label: 'Store'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined), label: 'Account'),
        ],
        selectedItemColor: Commons.themeAccentDarkColor,
        unselectedItemColor: Commons.themePrimaryColor,
        selectedLabelStyle: TextStyle(
          fontFamily: 'nu_bold',
          fontSize: 12.0,
          color: Commons.themeAccentDarkColor,
        ),
        unselectedLabelStyle: TextStyle(
            fontFamily: 'nu_bold',
            fontSize: 12.0,
            color: Commons.themePrimaryColor),
      ),
    );
  }

  Widget _showScreen(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
        break;
      case 1:
        return StoreScreen();
        break;
      case 2:
        return AccountScreen();
        break;
      default:
        return TextingScreen('Defult');
    }
  }
}
