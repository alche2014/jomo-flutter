import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jomo_flutter/Activities/RegistrationScreen.dart';
import 'package:jomo_flutter/Fragments/InternetWidget.dart';
import 'package:jomo_flutter/Model/LoginCheckModel.dart';
import 'package:jomo_flutter/Utils/BackBone.dart';
import 'package:jomo_flutter/Utils/Commons.dart';
import 'package:jomo_flutter/Utils/DialogBox.dart';
import 'package:jomo_flutter/Utils/NetworkRequest.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    // TODO: implement initState
    RequestManager.instance!.getParcels();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return InternetWidget(
        child: ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width,
        minHeight: MediaQuery.of(context).size.height,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Commons.themeAccentDarkColor,
                image: DecorationImage(
                  image: AssetImage("assets/images/accountbg.png"),
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Material(
                      color: Commons.colorTransparent,
                      child: InkWell(
                          onTap: () {
                            print('Dialog');
                            dialogBox(context, 'Logout', 'Are you sure you want to sign out?', 'Cancel', 'Sure', _loginout);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Icon(Icons.login, color: Commons.colorWhite),
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: FutureBuilder<LoginCheckModel>(
                        future: getLoginInfo(),
                        builder: (BuildContext context,
                            AsyncSnapshot<LoginCheckModel> snapshot) {
                          LoginCheckModel? object = snapshot.data;
                          return object!.isLogin == true
                              ? Material(
                                  color: Commons.colorTransparent,
                                  child: InkWell(
                                    onTap: () {

                                    },
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                              child: Image.asset(
                                                'assets/images/placeholder.png',
                                                height: 50.0,
                                                width: 50.0,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: Text(
                                                  object.userModel.displayName
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontFamily: 'nu_regular',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Text(
                                                  object.userModel.email
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontFamily: 'nu_regular',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Material(
                                  color: Commons.colorTransparent,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  RegistrationScreen()));
                                    },
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                              child: Image.asset(
                                                'assets/images/placeholder.png',
                                                height: 50.0,
                                                width: 50.0,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: Text("Sign In / Register",
                                                  style: TextStyle(
                                                    fontFamily: 'AvenirBook',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                  )),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Commons
                                                      .themePrimaryColor),
                                              margin:
                                                  EdgeInsets.only(top: 10.0),
                                              child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 3,
                                                      horizontal: 8),
                                                  child: Text(
                                                    '60 off for new user',
                                                    style: TextStyle(
                                                        color: Commons
                                                            .themeSecondaryColor,
                                                        fontFamily:
                                                            'nu_regular',
                                                        fontSize: 14),
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }


  _loginout() async{
    await expireToken();
    Navigator.of(context).pop();
    setState(() {});
  }
}
