import 'dart:convert';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jomo_flutter/GraphqlOperations/MutationQueries.dart';
import 'package:jomo_flutter/Model/SignupModel.dart';
import 'package:jomo_flutter/Utils/Commons.dart';
import 'package:jomo_flutter/Utils/GraphQlHelper.dart';
import 'package:jomo_flutter/Utils/Toast.dart';
import 'package:jomo_flutter/Utils/GlobelTab.dart' as globals;

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String defaultCode = "+92";
  String? firstName, lastName, email, password, confirmPassword, phone;

  bool passwordVisibility = true;
  bool privacypolicycheck = false;
  bool conformpasswordVisibility = true;

  bool isPhoneValid = false;
  bool isEmailValid = false;
  bool isLastNameValid = false;
  bool isPasswordValid = false;
  bool isFirstNameValid = false;
  bool isConfirmPasswordValid = false;

  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _conformPasswordController = TextEditingController();

  bool inProgress = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GraphQLProvider(
        client: GraphQlHelper.instance!.client,
        child: Mutation(
            options: MutationOptions(
                document: GraphQlHelper.instance!.gql(registration),
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
                }),
            builder: (RunMutation? mutation, QueryResult? result) {
              return Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        child: TextField(
                            textInputAction: TextInputAction.next,
                            controller: _firstnameController,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 14.0),
                            decoration: new InputDecoration(
                              contentPadding: EdgeInsets.only(top: 15, left: 0),
                              hintText: "First Name",
                              prefixIcon: Icon(Icons.perm_identity_outlined),
                              errorText: isFirstNameValid
                                  ? "Please enter valid name"
                                  : null,
                            ))),
                    Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: TextField(
                            textInputAction: TextInputAction.next,
                            controller: _lastnameController,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 14.0),
                            decoration: new InputDecoration(
                              contentPadding: EdgeInsets.only(top: 15, left: 0),
                              hintText: "Last Name",
                              prefixIcon: Icon(Icons.perm_identity_outlined),
                              errorText: isLastNameValid
                                  ? "Please enter valid name"
                                  : null,
                            ))),
                    Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: TextField(
                            textInputAction: TextInputAction.next,
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(fontSize: 14.0),
                            decoration: new InputDecoration(
                              contentPadding: EdgeInsets.only(top: 15, left: 0),
                              hintText: "Email",
                              prefixIcon: Icon(Icons.mail_outline_outlined),
                              errorText: isEmailValid
                                  ? "Please enter valid email"
                                  : null,
                            ))),
                    Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: TextField(
                            textInputAction: TextInputAction.next,
                            obscureText: passwordVisibility,
                            style: TextStyle(fontSize: 14.0),
                            controller: _passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: new InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(top: 15, left: 0),
                                hintText: "Password",
                                prefixIcon: Icon(Icons.vpn_key_outlined),
                                errorText: isPasswordValid
                                    ? "Please enter valid password, Must have 4 characters"
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
                        margin: EdgeInsets.only(top: 10.0),
                        child: TextField(
                            textInputAction: TextInputAction.next,
                            obscureText: conformpasswordVisibility,
                            style: TextStyle(fontSize: 14.0),
                            controller: _conformPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: new InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(top: 15, left: 0),
                                hintText: "Confirm Password",
                                prefixIcon: Icon(Icons.vpn_key_outlined),
                                errorText: isConfirmPasswordValid
                                    ? "Please enter valid confirm password"
                                    : null,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    conformpasswordVisibility
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      conformpasswordVisibility =
                                          !conformpasswordVisibility;
                                    });
                                  },
                                )))),
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: TextField(
                          textInputAction: TextInputAction.done,
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(fontSize: 14.0),
                          decoration: new InputDecoration(
                            contentPadding: EdgeInsets.only(top: 15, left: 0),
                            hintText: "Phone Number",
                            prefixIcon: CountryCodePicker(
                              onChanged: (CountryCode selectedValue) {
                                defaultCode = selectedValue.dialCode!;
                                print("selectedCode: " +
                                    selectedValue.code.toString());
                              },
                              dialogSize: Size(300.0, 500.0),
                              initialSelection: 'pk',
                              hideSearch: true,
                              showCountryOnly: false,
                              showOnlyCountryWhenClosed: false,
                              alignLeft: false,
                            ),
                            errorText: isPhoneValid
                                ? "Please enter valid number! Must have 8 characters"
                                : null,
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                            checkColor: Colors.red,
                            value: privacypolicycheck,
                            onChanged: (bool? newValue) {
                              setState(() {
                                privacypolicycheck = newValue!;
                              });
                            },
                          ),
                          Expanded(
                            child: RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Commons.themePrimaryDarkColor,
                                    letterSpacing: 0.5,
                                  ),
                                  children: [
                                    TextSpan(text: "I agree to LimeLight "),
                                    TextSpan(
                                        text: "Terms & Conditions ",
                                        //recognizer: TapGestureRecognizer()..onTap = () => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> TermsC())),
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: "and "),
                                    TextSpan(
                                        text: "Privacy Policy.",
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            print('Data');
                                          },
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15.0),
                      child: ElevatedButton(
                          onPressed: () {
                            _registerAccount(mutation!);
                          },
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
                                              strokeWidth: 2,
                                              color: Colors.white,
                                            )),
                                      )
                                    : SizedBox(),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "REGISTER",
                                    style: TextStyle(color: Commons.colorWhite),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  void onSuccess(BuildContext context, dynamic resultData) {
    FocusScope.of(context).unfocus();
    if (resultData != null) {
      Map<String, dynamic> convert = resultData;
      SignUpModel response = signUpModelFromJson(convert);
      if (response.customerCreate!.customerUserErrors == null) {
        if (response.customerCreate!.customer!.id!.isNotEmpty) {
          ShowToast.showToastInBottam(context,
              'Account created successfully! Please login with your new credentials');
          _refreshView();
          globals.tabController!.animateTo(1);
        }
      } else {
        if (response.customerCreate!.customerUserErrors![0].field == null) {
          _refreshView();
          globals.tabController!.animateTo(1);
        }
        ShowToast.showToastInBottam(context,
            response.customerCreate!.customerUserErrors![0].message.toString());
      }
    } else {
      ShowToast.showToastInBottam(
          context, 'Something wrong! Please try again later');
    }
  }

  void _registerAccount(RunMutation mutation) async {
    loadingStart();
    if (validation()) {
      print("All Good");
      mutation(
        <String, dynamic>{
          "input": {
            "firstName": "${firstName}",
            "lastName": "${lastName}",
            "email": "${email}",
            "password": "${confirmPassword}",
            "phone": "${phone}",
            "acceptsMarketing": privacypolicycheck,
          }
        },
      );
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

  _refreshView() {
    _phoneController.clear();
    _emailController.clear();
    _passwordController.clear();
    _lastnameController.clear();
    _firstnameController.clear();
    _conformPasswordController.clear();
    setState(() {
      privacypolicycheck = false;
    });
  }

  bool validation() {
    Pattern emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp emailregex = new RegExp(emailPattern.toString());
    //First Name
    if (_firstnameController.text.trim().isEmpty) {
      setState(() {
        isFirstNameValid = true;
      });
      return false;
    } else {
      setState(() {
        isFirstNameValid = false;
      });
      firstName = _firstnameController.text.trim();
    }
    //Last Name
    if (_lastnameController.text.trim().isEmpty) {
      setState(() {
        isLastNameValid = true;
      });
      return false;
    } else {
      setState(() {
        isLastNameValid = false;
      });
      lastName = _lastnameController.text.trim();
    }
    //Email
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
    //Password
    if (_passwordController.text.trim().isEmpty ||
        (_passwordController.text.trim()).length < 4) {
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
    //Confirm password
    if (_conformPasswordController.text.trim() != password) {
      setState(() {
        isConfirmPasswordValid = true;
      });
      return false;
    } else {
      setState(() {
        isConfirmPasswordValid = false;
      });
      confirmPassword = _conformPasswordController.text.trim();
    }
    //Phone Number
    if (_phoneController.text.trim().isEmpty ||
        (_phoneController.text.trim()).length < 8) {
      setState(() {
        isPhoneValid = true;
      });
      return false;
    } else {
      setState(() {
        isPhoneValid = false;
      });
      phone = defaultCode + _phoneController.text.trim();
    }
    if (!privacypolicycheck) {
      ShowToast.showToastInBottam(context, 'Accepts our terms and conditions');
      return false;
    }
    return true;
  }
}
