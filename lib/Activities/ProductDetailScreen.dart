import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late ScrollController _scrollController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
                expandedHeight: 400.0,
                floating: false,
                pinned: true,
                backgroundColor: Colors.white,
                leading: Container(
                  padding: EdgeInsets.all(8.0),
                  color: Colors.transparent,
                  child: InkWell(
                    customBorder: CircleBorder(),
                    onTap: () => Navigator.of(context).pop(),
                    child:
                    Icon(Icons.arrow_back, color: Colors.black),
                  ),
                ),
                actions: <Widget>[
                  InkWell(
                    customBorder: CircleBorder(),
                    onTap: () {
                      // _shareStoreUrl(
                      //     productDetails.onlineStoreUrl)
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.share, color: Colors.black),
                    ),
                  ),
                  InkWell(
                    customBorder: CircleBorder(),
                    onTap: () {
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.more_horiz,
                          color: Colors.black),
                    ),
                  ),
                ],
//                 flexibleSpace: FlexibleSpaceBar(
//                     centerTitle: false,
//                     title: isShrink
//                         ? SafeArea(
//                         child: Column(children: <Widget>[
//                           Container(
//                               alignment: Alignment.topLeft,
//                               padding: EdgeInsets.only(
//                                   top: MediaQuery.of(context)
//                                       .size
//                                       .height *
//                                       0.012),
//                               child: Text(
//                                 productDetails.title,
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 10,
//                                     fontFamily: 'Avenir'),
//                               )),
//                           Container(
//                               alignment: Alignment.topLeft,
//                               child: Text(
//                                 productDetails
//                                     .variantsList
//                                     .variantedges
//                                     .first
//                                     .variant
//                                     .price
//                                     .toString(),
//                                 style: TextStyle(
//                                     color: Colors.red,
//                                     fontSize: 10,
//                                     fontFamily: 'Avenir'),
//                               ))
//                         ]))
//                         : Container(),
//                     background: Container(
//                       child: Stack(
//                         children: <Widget>[
//                           Container(
//                             child: Swiper(
//                               itemCount: productDetails
//                                   .images.imageedges.length,
//                               itemBuilder: (BuildContext context,
//                                   int index) {
//                                 sliderposition.sink.add(index + 1);
//                                 return PhotoItem(
//                                     imageUrl: productDetails.images
//                                         .imageedges[index].img.src);
//                               },
//                               autoplay: false,
//                               outer: false,
//                             ),
//                           ),
//                           Container(
//                             child: Align(
//                               alignment:
//                               FractionalOffset.bottomLeft,
//                               child: Container(
//                                 margin: EdgeInsets.only(
//                                     bottom: 20, left: 20),
//                                 padding: EdgeInsets.symmetric(
//                                     vertical: 3, horizontal: 10),
//                                 decoration: BoxDecoration(
//                                   color:
//                                   Colors.black.withOpacity(0.4),
//                                   borderRadius:
//                                   BorderRadius.circular(10),
//                                 ),
//                                 child: StreamBuilder<int>(
//                                     stream: sliderposition,
//                                     builder: (context, snapshot) {
//                                       return Text(
//                                         snapshot.data.toString() +
//                                             "/" +
//                                             productDetails.images
//                                                 .imageedges.length
//                                                 .toString(),
//                                         style: TextStyle(
//                                             color: Colors.white,
//                                             fontFamily: 'Avenir',
//                                             fontSize: 11),
//                                       );
//                                     }),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ))),
//             SliverList(
//                 delegate: SliverChildListDelegate([
//                   Stack(
//                     children: <Widget>[
//                       SingleChildScrollView(
//                         child: Container(
//                           child: Container(
//                               color: Colors.white,
//                               child: Column(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.start,
//                                 crossAxisAlignment:
//                                 CrossAxisAlignment.start,
//                                 children: <Widget>[
//                                   Container(
//                                     margin: EdgeInsets.symmetric(
//                                         horizontal: 20, vertical: 0),
//                                     child: Row(
//                                       // crossAxisAlignment: CrossAxisAlignment.center,
//                                       mainAxisAlignment:
//                                       MainAxisAlignment
//                                           .spaceBetween,
//                                       mainAxisSize: MainAxisSize.max,
//                                       children: <Widget>[
//                                         Column(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                           crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                           children: <Widget>[
//                                             S.sDivider(height: 8),
//                                             Container(
//                                               child: Text(
//                                                 'Rs. 50',
//                                                 style: TextStyle(
//                                                   color:
//                                                   Color(0xFF19AE97),
//                                                   fontWeight:
//                                                   FontWeight.w500,
//                                                   fontSize: 18,
//                                                   fontStyle:
//                                                   FontStyle.normal,
//                                                   fontFamily: 'Avenir',
//                                                 ),
//                                               ),
//                                             ),
//                                             Visibility(
//                                               visible: productDetails
//                                                   .variantsList
//                                                   .variantedges
//                                                   .first
//                                                   .variant
//                                                   .price ==
//                                                   productDetails
//                                                       .variantsList
//                                                       .variantedges
//                                                       .first
//                                                       .variant
//                                                       .compareAtPrice
//                                                   ? false
//                                                   : true,
//                                               child: Row(
//                                                 children: <Widget>[
//                                                   Container(
//                                                     child: Text(
//                                                       'Rs. 75',
//                                                       style: TextStyle(
//                                                           color: Color(
//                                                               0xFFA1A1A1),
//                                                           fontSize: 12,
//                                                           fontFamily:
//                                                           'Avenir',
//                                                           decoration:
//                                                           TextDecoration
//                                                               .lineThrough),
//                                                     ),
//                                                   ),
//                                                   Container(
//                                                     margin: EdgeInsets
//                                                         .symmetric(
//                                                         horizontal:
//                                                         10),
//                                                     decoration:
//                                                     BoxDecoration(
//                                                       color: Colors.red,
//                                                       borderRadius:
//                                                       BorderRadius
//                                                           .circular(
//                                                           3),
//                                                     ),
//                                                     child: Padding(
//                                                       padding: EdgeInsets
//                                                           .only(
//                                                           left: 5,
//                                                           right: 5,
//                                                           bottom: 2,
//                                                           top: 2),
//                                                       child: Text(
//                                                         '${getdiscountpercentage(int.parse(productDetails.variantsList.variantedges.first.variant.price.split('.')[0]), int.parse(productDetails.variantsList.variantedges.first.variant.compareAtPrice.split('.')[0])).toString()} %',
//                                                         style: TextStyle(
//                                                             color: Colors
//                                                                 .white,
//                                                             fontFamily:
//                                                             'Avenir',
//                                                             fontSize:
//                                                             9.0),
//                                                       ),
//                                                     ),
//                                                   )
//                                                 ],
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                         GestureDetector(
//                                           onTap: () {
//                                             Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         ProductReview(
//                                                             totalUsers:
//                                                             15,
//                                                             avgRating:
//                                                             5,
//                                                             productId:
//                                                             productDetails
//                                                                 .id)));
//                                           },
//                                           child: Container(
//                                             margin:
//                                             EdgeInsets.symmetric(
//                                                 vertical: 12),
//                                             child: Row(
//                                               children: <Widget>[
//                                                 RatingBar.builder(
//                                                   // ignoreGestures: _isLoadingRating,
//                                                   ignoreGestures: true,
//
//                                                   initialRating: 5,
//                                                   minRating: 0,
//                                                   direction:
//                                                   Axis.horizontal,
//                                                   allowHalfRating: true,
//                                                   itemSize: 15,
//                                                   itemCount: 5,
//                                                   itemPadding: EdgeInsets
//                                                       .symmetric(
//                                                       horizontal:
//                                                       1.0),
//                                                   itemBuilder:
//                                                       (context, _) =>
//                                                       Icon(
//                                                         Icons.star,
//                                                         color: Colors
//                                                             .yellow[700],
//                                                         // color: Color(0xff489FB5),
//                                                       ),
//                                                   unratedColor:
//                                                   Color(0xffdfe6e9),
//                                                   onRatingUpdate:
//                                                       (rating) async {
//                                                     // if (widget.currentOnlineUser == null) {
//                                                     //   showModal(context);
//                                                     // } else {
//                                                     //   if (!_isLoadingRating) {
//                                                     //     setState(() {
//                                                     //       _isLoadingRating = true;
//                                                     //     });
//                                                     //     await _ratePost(rating, _alreadyRated);
//                                                     //   } else {
//                                                     //     setState(() {});
//                                                     //   }
//                                                     // }
//                                                   },
//                                                 ),
//                                                 S.sVerticalDivider(
//                                                     width: 4),
//                                                 Container(
//                                                   child: Text(
//                                                     '15',
//                                                     style: TextStyle(
//                                                         color:
//                                                         Colors.grey,
//                                                         fontFamily:
//                                                         'Avenir',
//                                                         fontSize: 12),
//                                                   ),
//                                                 ),
//                                                 S.sVerticalDivider(
//                                                     width: 4),
//                                                 Icon(
//                                                     Icons
//                                                         .arrow_forward_ios,
//                                                     color: Colors.grey,
//                                                     size: 12)
//                                               ],
//                                             ),
//                                           ),
//                                         )
//
//                                         //////////////////////Anees/////////////////////
//                                         // Column(
//                                         //   crossAxisAlignment:
//                                         //   CrossAxisAlignment.end,
//                                         //   children: [
//                                         //     StreamBuilder<
//                                         //         cloud_firestore
//                                         //             .DocumentSnapshot>(
//                                         //         stream: FirebaseRepo
//                                         //             .commentRatingCollection
//                                         //             .doc(
//                                         //             productDetails.id)
//                                         //             .snapshots(),
//                                         //         builder:
//                                         //             (context, snapshot) {
//                                         //           if (snapshot.hasData) {
//                                         //             if (snapshot
//                                         //                 .data.exists) {
//                                         //               int totalUers =
//                                         //               snapshot.data[
//                                         //               "totalNoUsers"];
//                                         //               double rating = 0.0;
//                                         //               if (totalUers ==
//                                         //                   null ||
//                                         //                   totalUers ==
//                                         //                       0) {
//                                         //                 rating = 0.0;
//                                         //               } else {
//                                         //                 if (snapshot.data[
//                                         //                 "totalRating"] ==
//                                         //                     null) {
//                                         //                   rating = 0.0;
//                                         //                 } else {
//                                         //                   rating = snapshot
//                                         //                       .data[
//                                         //                   "totalRating"] /
//                                         //                       totalUers;
//                                         //                 }
//                                         //               }
//                                         //               return GestureDetector(
//                                         //                 onTap: () {
//                                         //                   Navigator.push(
//                                         //                       context,
//                                         //                       MaterialPageRoute(
//                                         //                           builder: (context) => ProductReview(
//                                         //                               totalUsers:
//                                         //                               totalUers,
//                                         //                               avgRating:
//                                         //                               rating,
//                                         //                               productId:
//                                         //                               productDetails.id)));
//                                         //                 },
//                                         //                 child: Container(
//                                         //                   margin: EdgeInsets
//                                         //                       .symmetric(
//                                         //                       vertical:
//                                         //                       12),
//                                         //                   child: Row(
//                                         //                     children: <
//                                         //                         Widget>[
//                                         //                       RatingBar
//                                         //                           .builder(
//                                         //                         // ignoreGestures: _isLoadingRating,
//                                         //                         ignoreGestures:
//                                         //                         true,
//                                         //
//                                         //                         initialRating:
//                                         //                         rating,
//                                         //                         minRating:
//                                         //                         0,
//                                         //                         direction:
//                                         //                         Axis.horizontal,
//                                         //                         allowHalfRating:
//                                         //                         true,
//                                         //                         itemSize:
//                                         //                         15,
//                                         //                         itemCount:
//                                         //                         5,
//                                         //                         itemPadding:
//                                         //                         EdgeInsets.symmetric(
//                                         //                             horizontal: 1.0),
//                                         //                         itemBuilder:
//                                         //                             (context, _) =>
//                                         //                             Icon(
//                                         //                               Icons
//                                         //                                   .star,
//                                         //                               color: Colors
//                                         //                                   .yellow[700],
//                                         //                               // color: Color(0xff489FB5),
//                                         //                             ),
//                                         //                         unratedColor:
//                                         //                         Color(
//                                         //                             0xffdfe6e9),
//                                         //                         onRatingUpdate:
//                                         //                             (rating) async {
//                                         //                           // if (widget.currentOnlineUser == null) {
//                                         //                           //   showModal(context);
//                                         //                           // } else {
//                                         //                           //   if (!_isLoadingRating) {
//                                         //                           //     setState(() {
//                                         //                           //       _isLoadingRating = true;
//                                         //                           //     });
//                                         //                           //     await _ratePost(rating, _alreadyRated);
//                                         //                           //   } else {
//                                         //                           //     setState(() {});
//                                         //                           //   }
//                                         //                           // }
//                                         //                         },
//                                         //                       ),
//                                         //                       S.sVerticalDivider(
//                                         //                           width:
//                                         //                           4),
//                                         //                       Container(
//                                         //                         child:
//                                         //                         Text(
//                                         //                           '($totalUers)',
//                                         //                           style: TextStyle(
//                                         //                               color: Colors
//                                         //                                   .grey,
//                                         //                               fontFamily:
//                                         //                               'Avenir',
//                                         //                               fontSize:
//                                         //                               12),
//                                         //                         ),
//                                         //                       ),
//                                         //                       S.sVerticalDivider(
//                                         //                           width:
//                                         //                           4),
//                                         //                       Icon(
//                                         //                           Icons
//                                         //                               .arrow_forward_ios,
//                                         //                           color: Colors
//                                         //                               .grey,
//                                         //                           size:
//                                         //                           12)
//                                         //                     ],
//                                         //                   ),
//                                         //                 ),
//                                         //               );
//                                         //             } else {
//                                         //               return Container();
//                                         //             }
//                                         //           }
//                                         //           return Container();
//                                         //         }),
//                                         //     GestureDetector(
//                                         //       onTap: () {
//                                         //         feedbackbottamsheet(
//                                         //             context,
//                                         //             productDetails.id);
//                                         //       },
//                                         //       child: Container(
//                                         //         margin: EdgeInsets.only(
//                                         //             right: 4),
//                                         //         child: Txt(
//                                         //           "Add Feedback",
//                                         //           size: 13,
//                                         //           fontWeight:
//                                         //           FontWeight.w500,
//                                         //           textColor: Colors.black
//                                         //               .withOpacity(0.7),
//                                         //         ),
//                                         //       ),
//                                         //     )
//                                         //   ],
//                                         // )
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: EdgeInsets.only(
//                                         left: 20, right: 20, top: 6),
//                                     child: Text(
//                                       productDetails.title,
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontFamily: 'Avenir',
//                                           fontSize: 15,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                   Container(
//                                       margin: EdgeInsets.symmetric(
//                                           horizontal: 20),
//                                       // padding: EdgeInsets.symmetric(vertical: 5),
//
//                                       child: Html(
//                                         // blockSpacing: 1,
//                                         data: """
//                                               ${productDetails.descriptionHtml}
//                                           """,
//
//                                         linkStyle: const TextStyle(
//                                           color: Colors.redAccent,
//                                           decorationColor:
//                                           Colors.redAccent,
//                                           decoration:
//                                           TextDecoration.underline,
//                                         ),
//                                         onLinkTap: (url) {},
//                                         onImageTap: (src) {},
//                                         //Must have useRichText set to false for this to work
//                                         customRender: (node, children) {
//                                           if (node is dom.Element) {
//                                             // switch (node.localName) {
//                                             //   case "custom_tag":
//                                             //     return Column(children: children);
//                                             // }
//                                           }
//                                           print("Enter Here ....");
//                                           return null;
//                                           // return Column(
//                                           //   children: [...children.map((e) => e)],
//                                           // );
//                                         },
//                                         customTextAlign:
//                                             (dom.Node node) {
//                                           if (node is dom.Element) {
//                                             // switch (node.localName) {
//                                             //   case "p":
//                                             //     return TextAlign.justify;
//                                             // }
//                                           }
//                                           return null;
//                                         },
//                                         customTextStyle: (dom.Node node,
//                                             TextStyle baseStyle) {
//                                           if (node is dom.Element) {
//                                             // switch (node.localName) {
//                                             //   case "p":
//                                             //     return baseStyle.merge(TextStyle(height: 2, fontSize: 20));
//                                             // }
//                                           }
//                                           return baseStyle;
//                                         },
//                                       )
//
//                                     //Text(productDetails.description,style: TextStyle(fontSize: 15,fontFamily: 'Avenir'),),
//                                   ),
//                                   Column(
//                                     children: <Widget>[
//                                       Container(
//                                         margin: EdgeInsets.symmetric(
//                                             horizontal: 10,
//                                             vertical: 10),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment
//                                               .spaceBetween,
//                                           mainAxisSize:
//                                           MainAxisSize.max,
//                                           children: <Widget>[
//                                             Row(
//                                               mainAxisAlignment:
//                                               MainAxisAlignment
//                                                   .start,
//                                               children: <Widget>[
//                                                 Container(
//                                                   margin:
//                                                   EdgeInsets.only(
//                                                       left: 10),
//                                                   child: Text(
//                                                     'Size',
//                                                     style: TextStyle(
//                                                         fontWeight:
//                                                         FontWeight
//                                                             .bold,
//                                                         fontFamily:
//                                                         'Avenir',
//                                                         fontSize: 16),
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   child: Icon(
//                                                     Icons
//                                                         .arrow_drop_down,
//                                                     size: 18,
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                             Row(
//                                               children: <Widget>[
//                                                 Container(
//                                                   child: Icon(
//                                                     Icons.straighten,
//                                                     size: 18,
//                                                     color: Colors.grey
//                                                         .withOpacity(
//                                                         0.5),
//                                                   ),
//                                                 ),
//                                                 Container(
//                                                   padding:
//                                                   EdgeInsets.only(
//                                                       left: 3),
//                                                   child: Text(
//                                                     'Size Chart',
//                                                     style: TextStyle(
//                                                         fontFamily:
//                                                         'Avenir',
//                                                         fontSize: 16,
//                                                         color: Colors
//                                                             .grey
//                                                             .withOpacity(
//                                                             0.5)),
//                                                   ),
//                                                 )
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                       Container(
//                                         margin: EdgeInsets.symmetric(
//                                             horizontal: 20,
//                                             vertical: 5),
//                                         child: GridView.builder(
//                                           itemCount: productDetails
//                                               .variantsList
//                                               .variantedges
//                                               .length,
//                                           shrinkWrap: true,
//                                           physics:
//                                           NeverScrollableScrollPhysics(),
//                                           gridDelegate:
//                                           SliverGridDelegateWithFixedCrossAxisCount(
//                                               crossAxisCount: 3,
//                                               mainAxisSpacing: 2,
//                                               crossAxisSpacing: 2,
//                                               childAspectRatio:
//                                               2.7),
//                                           itemBuilder:
//                                               (BuildContext context,
//                                               int index) {
//                                             return Material(
//                                               color: Colors.transparent,
//                                               child: InkWell(
//                                                 splashColor: Colors.grey
//                                                     .withOpacity(0.7),
//                                                 onTap: () =>
//                                                     _onSelectedsize(
//                                                         index),
//                                                 child: Center(
//                                                   child: Container(
//                                                     padding: EdgeInsets
//                                                         .symmetric(
//                                                         vertical: 8,
//                                                         horizontal:
//                                                         20),
//                                                     decoration: BoxDecoration(
//                                                         border: Border.all(
//                                                             color: Colors
//                                                                 .grey
//                                                                 .shade500,
//                                                             width: 0.4),
//                                                         color: _selectsizeIndex !=
//                                                             null &&
//                                                             _selectsizeIndex ==
//                                                                 index
//                                                             ? Colors.red
//                                                             : Colors
//                                                             .white),
//                                                     child: Text(
//                                                       productDetails
//                                                           .variantsList
//                                                           .variantedges[
//                                                       index]
//                                                           .variant
//                                                           .title,
//                                                       style: TextStyle(
//                                                           fontFamily:
//                                                           'Avenir',
//                                                           fontSize: 12),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Container(
//                                       margin: EdgeInsets.symmetric(
//                                         horizontal: 20,
//                                       ),
//                                       alignment: Alignment.topLeft,
//                                       child: Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment
//                                             .spaceBetween,
//                                         mainAxisSize: MainAxisSize.max,
//                                         children: <Widget>[
//                                           Container(
//                                             child: Text(
//                                               'QTY:',
//                                               style: TextStyle(
//                                                   fontSize: 14,
//                                                   fontFamily: 'Avenir',
//                                                   fontWeight:
//                                                   FontWeight.w700),
//                                             ),
//                                           ),
//                                           Container(
//                                             margin:
//                                             EdgeInsets.symmetric(
//                                                 horizontal: 20,
//                                                 vertical: 5),
//                                             child: Row(
//                                               children: <Widget>[
//                                                 Material(
//                                                   color: Colors
//                                                       .transparent,
//                                                   child: InkWell(
//                                                     splashColor: Colors
//                                                         .grey
//                                                         .withOpacity(
//                                                         0.7),
//                                                     onTap: () {
//                                                       setState(() {
//                                                         _onminusitem();
//                                                       });
//                                                     },
//                                                     child: SizedBox(
//                                                       height: 25,
//                                                       width: 30,
//                                                       child: Container(
//                                                         alignment:
//                                                         Alignment
//                                                             .center,
//                                                         decoration: BoxDecoration(
//                                                             border: Border.all(
//                                                                 width:
//                                                                 0.1)),
//                                                         child: Icon(
//                                                           Icons
//                                                               .minimize,
//                                                           size: 16,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 SizedBox(
//                                                   height: 25,
//                                                   width: 30,
//                                                   child: AnimatedContainer(
//                                                       duration: Duration(
//                                                           milliseconds:
//                                                           300),
//                                                       alignment:
//                                                       Alignment
//                                                           .center,
//                                                       decoration: BoxDecoration(
//                                                           border: Border
//                                                               .all(
//                                                               width:
//                                                               0.1)),
//                                                       child: Text(
//                                                           '$cartitems')),
//                                                 ),
//                                                 Material(
//                                                   color: Colors
//                                                       .transparent,
//                                                   child: InkWell(
//                                                     splashColor: Colors
//                                                         .grey
//                                                         .withOpacity(
//                                                         0.7),
//                                                     onTap: () {
//                                                       // setState(() {
//                                                       _onadditem();
//                                                       // });
//                                                     },
//                                                     child: SizedBox(
//                                                       height: 25,
//                                                       width: 30,
//                                                       child: Container(
//                                                         alignment:
//                                                         Alignment
//                                                             .center,
//                                                         decoration: BoxDecoration(
//                                                             border: Border.all(
//                                                                 width:
//                                                                 0.1)),
//                                                         child: Icon(
//                                                           Icons.add,
//                                                           size: 16,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       )),
//                                   Container(
//                                     margin: EdgeInsets.only(
//                                         top: 10, bottom: 20),
//                                     child: Row(
//                                       children: [
// //////////////////////Anees/////////////////////
// //                                                 Expanded(
// //                                                   child: Container(
// //                                                     width: deviceWidth,
// //                                                     height: 40,
// //                                                     margin: EdgeInsets.only(left: 20),
// //                                                     decoration: BoxDecoration(
// //                                                       color: Color(0xFF19AE97),
// //                                                     ),
// //                                                     child: RaisedButton(
// //                                                         color: Color(0xFF19AE97),
// //                                                         onPressed: (){
// //                                                           if (_selectsizeIndex == null) {
// //                                                             ShowToast.showToastInCenter(
// //                                                                 context, 'Please Select Size');
// //                                                           } else if (_selectsizeIndex != null) {
// //                                                             Map<String, dynamic> row = {
// //                                                               'graphid': productDetails.id,
// //                                                               'p_name': productDetails.title,
// //                                                               'p_id': productDetails.id,
// //                                                               'p_color': productDetails.title,
// //                                                               'p_size': productDetails.variantsList
// //                                                                   .variantedges[0].variant.title ==
// //                                                                   'Default Title'
// //                                                                   ? productDetails
// //                                                                   .variantsList.variantedges.first.variant.title
// //                                                                   : productDetails.variantsList
// //                                                                   .variantedges[_selectsizeIndex].variant.title,
// //                                                               'varient_id': productDetails.variantsList
// //                                                                   .variantedges[_selectsizeIndex].variant.id,
// //                                                               'p_image':
// //                                                               productDetails.images.imageedges.first.img.src,
// //                                                               'price': productDetails.variantsList
// //                                                                   .variantedges[_selectsizeIndex].variant.price,
// //                                                               'quantity': cartitems,
// //                                                               'compare_price': productDetails
// //                                                                   .variantsList
// //                                                                   .variantedges[_selectsizeIndex]
// //                                                                   .variant
// //                                                                   .compareAtPrice,
// //                                                               'sku': productDetails.variantsList
// //                                                                   .variantedges[_selectsizeIndex].variant.sku
// //                                                             };
// //
// //                                                             databaseHelper.insert(row).then((val) {
// //                                                               Future.delayed(Duration(seconds: 3));
// //                                                               print('====== back result $val');
// //                                                               if(val!=-1 || val!=0){
// //                                                                 Provider.of<CartNotifier>(context).getcartsItems();
// //                                                                 Provider.of<CartNotifier>(context).getcarts();
// //                                                                 ShowToast.showToastInCenter(
// //                                                                     context, 'Save to cart successfull');
// //
// //                                                                 if (isScroll) {
// //                                                                   _scrollController.animateTo(
// //                                                                     800.0,
// //                                                                     curve: Curves.easeOut,
// //                                                                     duration: const Duration(milliseconds: 1000),
// //                                                                   );
// //                                                                 }
// //                                                                 // Navigator.pop(context);
// //                                                               }else{
// //                                                                 ShowToast.showToastInBottam(context, 'Some error occur');
// //                                                               }
// //                                                             });
// //                                                           }
// //                                                         },
// //
// //                                                         child:
// //                                                         widget.productNode.variants.variantedges.length < 2 &&
// //                                                             widget.productNode.variants.variantedges.first.variantnode.availableForSale == false
// //                                                             ?Text("SOLD OUT",
// //                                                             style:
// //                                                             TextStyle(
// //                                                                 color: Colors.white,
// //                                                                 fontWeight: FontWeight.w600,
// //                                                                 fontFamily: 'Avenir',
// //                                                                 fontSize: 14))
// //                                                             : widget.productNode.variants.variantedges.length > 2 && findout == 0
// //                                                             ?Text("SOLD OUT",
// //                                                             style:
// //                                                             TextStyle(
// //                                                                 color: Colors.white,
// //                                                                 fontWeight: FontWeight.w600,
// //                                                                 fontFamily: 'Avenir',
// //                                                                 fontSize: 14)
// //                                                         )
// //                                                             :Text("ADD TO CART",
// //                                                             style:
// //                                                             TextStyle(
// //                                                                 color: Colors.white,
// //                                                                 fontWeight: FontWeight.w600,
// //                                                                 fontFamily: 'Avenir',
// //                                                                 fontSize: 14)
// //                                                         )
// //                                                     ),
// //                                                   ),
// //                                                 ),
//                                         Expanded(
//                                           child: Container(
//                                             width: deviceWidth,
//                                             height: 40,
//                                             margin: EdgeInsets.only(
//                                                 left: 10, right: 20),
//                                             decoration: BoxDecoration(
//                                               color: Colors.black,
//                                             ),
//                                             child: RaisedButton(
//                                               color: Colors.black,
//                                               // splashColor: Colors.grey.withOpacity(0.7),
//                                               // onPressed: () => feedbackbottamsheet(context),
//                                               // onPressed: () => bottaamSheet(context,
//                                               // productDetails, _scrollController),
//                                               child: Container(
//                                                 alignment:
//                                                 Alignment.center,
//                                                 // width: MediaQuery.of(context).size.width * 0.6,
//
//                                                 child: Text(
//                                                   'NOTIFY ME',
//                                                   style: TextStyle(
//                                                       color:
//                                                       Colors.white,
//                                                       fontWeight:
//                                                       FontWeight
//                                                           .w600,
//                                                       fontFamily:
//                                                       'Avenir',
//                                                       fontSize: 14),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     margin: EdgeInsets.only(
//                                         bottom: 15,
//                                         left: 10,
//                                         right: 10),
//                                     alignment: Alignment.topLeft,
//                                     child: Text(
//                                       "Wear with",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 18,
//                                           fontFamily: 'Avenir'),
//                                     ),
//                                   ),
//                                   MediaQuery.removePadding(
//                                     context: context,
//                                     removeTop: true,
//                                     child: Container(
//                                       margin:
//                                       EdgeInsets.only(bottom: 55),
//                                       child: YouMayLike(
//                                         key: youMayLikeKey,
//                                         connectionStatus:
//                                         connectionStatus,
//                                       ),
//
//                                       //     YouMayLike(
//                                       //   tagslist: productDetails.tags,
//                                       //   key: youMayLikeKey,
//                                       //   connectionStatus:
//                                       //   connectionStatus,
//                                       // )
//                                     ),
//                                   )
//                                 ],
//                               )),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ])),
            )
          ],
        ),
      ),
    );
  }
}
