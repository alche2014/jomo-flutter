import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:jomo_flutter/Activities/BottamNavigationBar.dart';
import 'package:jomo_flutter/GraphqlOperations/MutationQueries.dart';
import 'package:jomo_flutter/Model/SigninModel.dart';
import 'package:jomo_flutter/Model/SignupModel.dart';
import 'package:jomo_flutter/Utils/Commons.dart';
import 'package:jomo_flutter/Utils/GraphQlHelper.dart';
import 'package:jomo_flutter/Utils/NetworkRequest.dart';
import 'package:jomo_flutter/Utils/Toast.dart';
import 'package:jomo_flutter/Utils/prefManager.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? email, password;
  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool passwordVisibility = true;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool inProgress = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQlHelper.instance!.client,
      child: Mutation(
        options: MutationOptions(
          document: GraphQlHelper.instance!.gql(userLogin),
          update: (GraphQLDataProxy? cache, QueryResult? result) {
            print("Update"+result!.data.toString());
          },
          onError: (OperationException? error) {
            print("OnERROR");
            loadingStop();
            ShowToast.showToastInBottam(context, error.toString());
          },
          onCompleted: (dynamic resultData) {
            print("OnComplete: " + resultData.toString());
            loadingStop();
            onSuccess(context, resultData);
          },
        ),
        builder: (RunMutation? mutation, QueryResult? result) {
          return Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                    child: TextField(
                        textInputAction: TextInputAction.next,
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(fontSize: 14.0),
                        decoration: new InputDecoration(
                          contentPadding: EdgeInsets.only(top: 15, left: 0),
                          hintText: "Email",
                          prefixIcon: Icon(Icons.mail_outline_outlined),
                          errorText:
                              isEmailValid ? "Please enter valid email" : null,
                        ))),
                Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: TextField(
                        textInputAction: TextInputAction.done,
                        obscureText: passwordVisibility,
                        style: TextStyle(fontSize: 14.0),
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: new InputDecoration(
                            contentPadding: EdgeInsets.only(top: 15, left: 0),
                            hintText: "Password",
                            prefixIcon: Icon(Icons.vpn_key_outlined),
                            errorText: isPasswordValid
                                ? "Please enter valid password"
                                : null,
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                passwordVisibility
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  passwordVisibility = !passwordVisibility;
                                });
                              },
                            )))),
                Container(
                  margin: EdgeInsets.only(top: 15.0),
                  child: ElevatedButton(
                      onPressed: () => _login(mutation!),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Stack(
                          children: [
                            inProgress
                                ? Align(
                                    alignment: Alignment.centerLeft,
                                    child: SizedBox(
                                        height: 20.0,
                                        width: 20.0,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        )),
                                  )
                                : SizedBox(),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "SIGN IN",
                                style: TextStyle(color: Commons.colorWhite),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                      onTap: () {
                        print("Navigate to the forget password screen");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Forget Password?"),
                      )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _login(RunMutation mutation) async {
    loadingStart();
    if (validation()) {
      mutation(<String, dynamic>{
        "input": {"email": "${email}", "password": "${password}"}
      });
    } else {
      loadingStop();
    }
  }

  loadingStart() {
    setState(() {
      inProgress = true;
    });
  }

  loadingStop() {
    setState(() {
      inProgress = false;
    });
  }

  bool validation() {
    Pattern emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp emailregex = new RegExp(emailPattern.toString());
    if (_emailController.text.trim().isEmpty ||
        !emailregex.hasMatch(_emailController.text.trim())) {
      setState(() {
        isEmailValid = true;
      });
      return false;
    } else {
      setState(() {
        isEmailValid = false;
      });
      email = _emailController.text.trim();
    }
    if (_passwordController.text.trim().isEmpty ||
        _passwordController.text.trim() == " ") {
      setState(() {
        isPasswordValid = true;
      });
      return false;
    } else {
      setState(() {
        isPasswordValid = false;
      });
      password = _passwordController.text.trim();
    }
    return true;
  }

  void onSuccess(BuildContext context, dynamic resultData) async {
    print("Response Data: "+resultData.toString());
    FocusScope.of(context).unfocus();
    if (resultData != null) {
      SignInModel data = signInModelFromJson(resultData);
      if (data.customerAccessTokenCreate!.customerAccessToken != null) {
        //Store data in sharedpreferences
        MySharedPreferences.instance.setBoolValue("isLogin", true);
        MySharedPreferences.instance.setStringValue(
            "accessToken",
            data.customerAccessTokenCreate!.customerAccessToken!.accessToken.toString());
        MySharedPreferences.instance.setStringValue(
            "expireAt",
            data.customerAccessTokenCreate!.customerAccessToken!.expiresAt.toString());
        //Get user details from server
        await RequestManager.instance!.getUserInfo(
            context,
            data.customerAccessTokenCreate!.customerAccessToken!.accessToken.toString());
        ShowToast.showToastInBottam(
            context,
            'Login Successfully!');
        //Navigate to the dashboard
        Navigator.of(context).pop();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => BottamNavigationBar(showIndex: 2)),
                (route) => false);
      } else {
        if (data.customerAccessTokenCreate!.customerUserErrors!.first
            .code ==
            "UNIDENTIFIED_CUSTOMER") {
          ShowToast.showToastInBottam(
              context,
              data
                  .customerAccessTokenCreate!.customerUserErrors!.first.message
                  .toString());
        }
      }
    }else{
      ShowToast.showToastInBottam(
          context, 'Something wrong! Please try again later');
    }
  }
}
