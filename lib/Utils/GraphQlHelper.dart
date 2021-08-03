import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:gql/ast.dart';
import 'package:gql/language.dart';
import 'package:normalize/utils.dart';

class GraphQlHelper {
  static GraphQlHelper? _helper;
  static String _URL = 'https://jomo-staging.myshopify.com/api/2019-07/graphql';
  static Map<String, String> _header = {
    'X-Shopify-Storefront-Access-Token': '7f3b53be4a6bcdb36fb56b686fc63c50',
    'Accept': 'application/json',
  };

  GraphQlHelper._internal() {}

  static GraphQlHelper? get instance {
    if (_helper == null) {
      _helper = GraphQlHelper._internal();
    }
    return _helper;
  }

  ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
    link: HttpLink(_URL, defaultHeaders: _header),
    cache: GraphQLCache(
    ),

  ));

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      link: HttpLink(_URL, defaultHeaders: _header),
      cache: GraphQLCache(),
    );
  }
  DocumentNode gql(String document) => transform(
    parseString(document),
    [AddNestedTypenameVisitor()],
  );

}

class AddNestedTypenameVisitor extends AddTypenameVisitor {
  @override
  visitFieldNode(node) => node;
  @override
  visitOperationDefinitionNode(node) => node;
  @override
  visitFragmentDefinitionNode(node) => node;

}
