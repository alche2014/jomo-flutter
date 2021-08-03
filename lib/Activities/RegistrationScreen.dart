import 'package:flutter/material.dart';
import 'package:jomo_flutter/Activities/SignInScreen.dart';
import 'package:jomo_flutter/Activities/SignUpScreen.dart';
import 'package:jomo_flutter/Utils/Commons.dart';
import 'package:jomo_flutter/Utils/GlobelTab.dart' as globals;
import 'package:jomo_flutter/Utils/NetworkRequest.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2, initialIndex: 0);
    globals.tabController = _tabController;
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Text(
            'Register / Sign In ',
            style: TextStyle(color: Colors.black, fontFamily: 'AvenirBook'),
          ),
          leading: Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.transparent,
            child: InkWell(
              customBorder: CircleBorder(),
              onTap: () => Navigator.of(context).pop(),
              child: Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
        ),
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Material(
                color: Colors.white,
                elevation: 5,
                child: TabBar(
                  controller: _tabController,
                  isScrollable: false,
                  unselectedLabelColor: Commons.themePrimaryColor,
                  labelColor: Commons.themePrimaryDarkColor,
                  indicatorColor: Commons.themePrimaryDarkColor,
                  tabs: <Widget>[
                    Tab(
                        child: Text(
                          'Register',
                          style: TextStyle(fontSize: 14.0, fontFamily: 'nu_bold'),
                        )),
                    Tab(
                      child: Text(
                        'Sign In',
                        style:
                        TextStyle(fontSize: 14.0, fontFamily: 'nu_bold'),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[SignupScreen(), SignInScreen()],
                ),
              ),
            ],
          ),
        ) );
  }
}
