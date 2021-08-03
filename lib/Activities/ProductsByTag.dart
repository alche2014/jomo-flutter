import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jomo_flutter/Fragments/LoadingView.dart';
import 'package:jomo_flutter/Fragments/TagProductView.dart';
import 'package:jomo_flutter/GraphqlOperations/ReadQueries.dart';
import 'package:jomo_flutter/Model/ProductModel.dart';
import 'package:jomo_flutter/Utils/Commons.dart';
import 'package:jomo_flutter/Utils/GraphQlHelper.dart';

class ProductTagScreen extends StatefulWidget {
  final String tag;

  const ProductTagScreen({Key? key, required this.tag}) : super(key: key);

  @override
  _ProductTagScreenState createState() => _ProductTagScreenState();
}

class _ProductTagScreenState extends State<ProductTagScreen> {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQlHelper.instance!.client,
      child: Query(
          options: QueryOptions(
            document: GraphQlHelper.instance!.gql(getProductsFromTags),
            fetchPolicy: FetchPolicy.networkOnly,
            errorPolicy: ErrorPolicy.ignore,
            cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
            variables: {
              'Tag': widget.tag,
            },
          ),
          builder: (QueryResult? result,
              {VoidCallback? refetch, FetchMore? fetchMore}) {
            if (result!.hasException) {
              return Text(result.exception.toString());
            }
            if (result.isLoading) {
              LoadingView();
            }
            if (result.data != null) {
              Products response = productTagModelFromJson(result.data!);
              print("Data return: "+productTagModelToJson(response));
              return GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.7,mainAxisSpacing: 20.0,crossAxisSpacing:20.0),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: response.edges!.map((ProductsEdge? object) {
                  return TagProductView(product: object!);
                }).toList(),
              );
            } else {
              return LoadingView();
            }
          }),
    );
  }
}
