import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jomo_flutter/Model/ProductModel.dart';
import 'package:jomo_flutter/Utils/Commons.dart';

class TagProductView extends StatefulWidget {
  final ProductsEdge product;

  const TagProductView({Key? key, required this.product}) : super(key: key);

  @override
  _TagProductViewState createState() => _TagProductViewState();
}

class _TagProductViewState extends State<TagProductView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: Commons.colorWhite,
      borderRadius: BorderRadius.circular(5.0),
      child: Column(children: <Widget>[
        Expanded(
          flex: 3,
          child: Stack(children: <Widget>[
            new Positioned.fill(
              bottom: 0.0,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.network(
                        widget.product.node!.images!.edges!.first.node!.src
                                    .toString() ==
                                null
                            ? 'assets/images/productplaceholder.png'
                            : widget
                                .product.node!.images!.edges!.first.node!.src
                                .toString(),
                        fit: BoxFit.cover),
                  )),
            ),
            new Positioned.fill(
                child: new Material(
                    color: Colors.transparent,
                    child: new InkWell(
                      customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              topLeft: Radius.circular(5))),
                      onTap: () {
                        print('Data');
                      },
                    ))),
          ]),
        ),
        Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "Rs. " +
                            widget.product.node!.variants!.edges!.first.node!
                                .price
                                .toString(),
                        style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'nu_semibold',
                            color: Color(0xFF202020)),
                      ),
                    ),
                    InkWell(
                        radius: 50,
                        borderRadius: BorderRadius.circular(4),
                        onTap: () {
                          print('Database');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.favorite_border_rounded,
                            size: 20,
                            color: Colors.black87,
                          ),
                        )),
                    // FutureBuilder<bool>(
                    //     future: DatabaseHelper.instance.checkwishexist(graphqlid),
                    //     builder: (context, snapshot) {
                    //       if (snapshot.hasData && snapshot.data) {
                    //         return InkWell(
                    //           onTap: () {
                    //             DatabaseHelper.instance
                    //                 .deletewish(graphqlid)
                    //                 .whenComplete(() {
                    //               setState(() {});
                    //             });
                    //           },
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(5.0),
                    //             child: Icon(
                    //               Icons.favorite_outlined,
                    //               size: 20,
                    //               color: Colors.black87,
                    //             ),
                    //           ),
                    //         );
                    //       } else {
                    //         return InkWell(
                    //             radius: 50,
                    //             borderRadius: BorderRadius.circular(4),
                    //             onTap: () {
                    //               Map<String, dynamic> row = {
                    //                 "graphid": graphqlid,
                    //                 "wishproduct_name": name,
                    //                 "wishproduct_image": image,
                    //                 "wishproduct_price": price,
                    //                 "isFav": 'true',
                    //               };
                    //               DatabaseHelper.instance
                    //                   .insertWishlist(row)
                    //                   .whenComplete(() {
                    //                 setState(() {});
                    //               });
                    //             },
                    //             child: Padding(
                    //               padding: const EdgeInsets.all(5.0),
                    //               child: Icon(
                    //                 Icons.favorite_border_rounded,
                    //                 size: 20,
                    //                 color: Colors.black87,
                    //               ),
                    //             ));
                    //       }
                    //     }),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 8),
                  child: Text(
                    "Rs. " +
                        widget.product.node!.variants!.edges!.first.node!.price
                            .toString(),
                    style: TextStyle(
                        fontSize: 11.0,
                        fontFamily: 'nu_semibold',
                        decoration: TextDecoration.lineThrough,
                        color: Color(0xFF787878)),
                  ),
                ),
              ],
            ))
      ]),
    );
  }
}
