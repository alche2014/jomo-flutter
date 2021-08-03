import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jomo_flutter/Activities/ProductDetailScreen.dart';
import 'package:jomo_flutter/Fragments/LoadingView.dart';
import 'package:jomo_flutter/GraphqlOperations/ReadQueries.dart';
import 'package:jomo_flutter/Model/ProductModel.dart';
import 'package:jomo_flutter/Utils/Commons.dart';
import 'package:jomo_flutter/Utils/GraphQlHelper.dart';

class ProductIDScreen extends StatefulWidget {
  final String graphId;

  const ProductIDScreen({Key? key, required this.graphId}) : super(key: key);

  @override
  _ProductIDScreenState createState() => _ProductIDScreenState();
}

class _ProductIDScreenState extends State<ProductIDScreen> {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQlHelper.instance!.client,
      child: Query(
          options: QueryOptions(
            document: GraphQlHelper.instance!.gql(getProductsFromGraphID),
            fetchPolicy: FetchPolicy.networkOnly,
            errorPolicy: ErrorPolicy.ignore,
            cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
            variables: {
              'CollectionId': widget.graphId,
              'shortkey': "PRICE",
              'rev': false,
              'cursor': null
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
            if(result.data!=null){
              ProductIdModel response = productIdModelFromJson(result.data!);
              return GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1,mainAxisSpacing: 4.0,crossAxisSpacing:4.0),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: response.node!.products!.edges!.map((ProductsEdge? object) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Commons.themeSecondaryColor),borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ProductDetailScreen()));
                        },
                        child: Ink.image(image: NetworkImage(object!.node!.images!.edges!.first.node!.src.toString()),
                          fit: BoxFit.cover),
                      ),
                  );
                }).toList(),
              );
            }else{
              return LoadingView();
            }
          }),
    );
  }
}
