import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jomo_flutter/GraphqlOperations/MutationQueries.dart';
import 'package:jomo_flutter/GraphqlOperations/ReadQueries.dart';
import 'package:jomo_flutter/Model/CustomPagesModel.dart';
import 'package:jomo_flutter/Model/ProductModel.dart';
import 'package:jomo_flutter/Model/UserModel.dart';
import 'package:jomo_flutter/Utils/Toast.dart';
import 'package:jomo_flutter/Utils/prefManager.dart';
import 'package:normalize/utils.dart';

import 'GraphQlHelper.dart';
import 'package:http/http.dart' as http;

class RequestManager {
  static RequestManager? _manager;

  RequestManager._internal() {}

  static RequestManager? get instance {
    if (_manager == null) {
      _manager = RequestManager._internal();
    }
    return _manager;
  }

  Future<void> getUserInfo(BuildContext context, String token) async {
    QueryResult result = await GraphQlHelper.instance!.clientToQuery().query(
        QueryOptions(
            document: gql(readProfileData),
            variables: {'customerAccessToken': token}));
    try {
      if (result.hasException) {
        ShowToast.showToastInBottam(
            context, "Something wrong! Please try again later");
      } else {
        UserModel userModel = UserModel.fromJson(result.data!);
        assert(userModel != null);
        Customer customer = userModel.customer!;
        MySharedPreferences.instance.setStringValue("id", customer.id!);
        MySharedPreferences.instance
            .setStringValue("fname", customer.firstName!);
        MySharedPreferences.instance
            .setStringValue("lname", customer.lastName!);
        MySharedPreferences.instance.setStringValue("email", customer.email!);
        MySharedPreferences.instance
            .setStringValue("displayname", customer.displayName!);
        MySharedPreferences.instance.setStringValue("phone", customer.phone!);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Customer?> updateCustomer(
      BuildContext context, String token, String key, String value) async {
    QueryResult result = await GraphQlHelper.instance!
        .clientToQuery()
        .query(QueryOptions(document: gql(updateQuery), variables: {
          "customerAccessToken": token,
          "customer": {key: value}
        }));
    try {
      if (result.hasException) {
        ShowToast.showToastInBottam(
            context, "Something wrong! Please try again later");
      } else {
        if (result.data!['customerUpdate']['customer'] != null) {
          UserModel userModel =
              UserModel.fromJson(result.data!['customerUpdate']);
          Customer customer = userModel.customer!;
          MySharedPreferences.instance.setStringValue("id", customer.id!);
          MySharedPreferences.instance
              .setStringValue("fname", customer.firstName!);
          MySharedPreferences.instance
              .setStringValue("lname", customer.lastName!);
          MySharedPreferences.instance.setStringValue("email", customer.email!);
          MySharedPreferences.instance
              .setStringValue("displayname", customer.displayName!);
          MySharedPreferences.instance.setStringValue("phone", customer.phone!);
          return customer;
        } else {
          ShowToast.showToastInBottam(
              context,
              result.data!['customerUpdate']['customerUserErrors'][0]
                  ['message']);
          return null;
        }
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<CustomPagesModel> getCustomPages() async {
    var response = await http.get(
        Uri.parse(
            'https://mobileapp-be.alche.cloud/custom_pages?shop=jomo-staging.myshopify.com'),
        headers: {
          "X-Access-Token": "Token 99fce5ce5ca06b0f7d15ead6c01c43c995403af8"
        });
    if (response.statusCode == 200) {
      final String responString = response.body;
      return customPagesModelFromJson(responString);
    } else {
      throw new Exception();
    }
  }

  getParcels() async {
    GraphQLClient client = GraphQlHelper.instance!.clientToQuery();
    QueryResult result = await client.query(QueryOptions(document: GraphQlHelper.instance!.gql(getProductsFromTags) , variables: {
      'Tag': 'shirt',
    }));
    try {
      if (result.hasException) {
        print('error: ' + result.exception!.graphqlErrors.toString());
      } else {
        print("responsebefore" + result.data!.toString());
        Products model = productTagModelFromJson(result.data!);
        print("responseafter" + productTagModelToJson(model));
      }
    } catch (e) {
      print(e);
    }
  }
}
