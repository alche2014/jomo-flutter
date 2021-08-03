import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:jomo_flutter/Fragments/InternetWidget.dart';
import 'package:jomo_flutter/Fragments/LoadingView.dart';
import 'package:jomo_flutter/Model/CustomPagesModel.dart';
import 'package:jomo_flutter/Utils/NetworkRequest.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int photoIndex = 0;

  List<String> photos = [
    'https://cdn.shopify.com/s/files/1/0508/2690/3702/files/Skechers_new_arrivals_2048x.png?v=1624864412',
    'https://cdn.shopify.com/s/files/1/0508/2690/3702/files/jomo-discounts_1_2048x.png?v=1621942603',
    'https://cdn.shopify.com/s/files/1/0508/2690/3702/files/EID-EDITION_2048x.png?v=1624955308',
    'https://cdn.shopify.com/s/files/1/0508/2690/3702/files/EID-EDITION-GOLD_2048x.png?v=1624273038',
    'https://cdn.shopify.com/s/files/1/0508/2690/3702/files/Limelight-Eid-ul-Adha-DT_bfd29638-29cc-4127-9cd7-c550888d17ce_2048x.png?v=1624605518',
    'https://cdn.shopify.com/s/files/1/0508/2690/3702/files/Cross-stitch-DT_2048x.png?v=1625209845'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Image.asset(
            'assets/images/applogo.jpg',
            width: 100,
          ),
        ),
        body: InternetWidget(
          child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Material(
                      elevation: 5,
                      child: Swiper(
                        scrollDirection: Axis.horizontal,
                        itemCount: photos.length,
                        layout: SwiperLayout.DEFAULT,
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            children: [
                              Positioned.fill(
                                  child: FadeInImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(photos[index]),
                                    placeholder: AssetImage(
                                        'assets/images/bannerplaceholder.jpg'),
                                  )),
                              Positioned.fill(
                                  child: Material(
                                      color: Colors.transparent,
                                      child: new InkWell(
                                        onTap: () {
                                          print('Data');
                                        },
                                      )))
                            ],
                          );
                        },
                      )


                    // CarouselSlider(
                    //   options: CarouselOptions(
                    //     height: 220.0,
                    //     reverse: false,
                    //     autoPlay: true,
                    //     autoPlayInterval: Duration(seconds: 3),
                    //     autoPlayAnimationDuration: Duration(milliseconds: 800),
                    //     autoPlayCurve: Curves.fastOutSlowIn,
                    //   ),
                    //   items: photos.map((img) {
                    //     return Builder(
                    //       builder: (BuildContext context) {
                    //         return Container(
                    //           margin: EdgeInsets.symmetric(horizontal: 2.0),
                    //           child: Stack(
                    //             children: [
                    //               Positioned.fill(
                    //                   child: FadeInImage(
                    //                 fit: BoxFit.cover,
                    //                 image: NetworkImage(img),
                    //                 placeholder: AssetImage(
                    //                     'assets/images/bannerplaceholder.jpg'),
                    //               )),
                    //               Positioned.fill(
                    //                   child: Material(
                    //                       color: Colors.transparent,
                    //                       child: new InkWell(
                    //                         onTap: () {
                    //                           print('Data');
                    //                         },
                    //                       )))
                    //             ],
                    //           ),
                    //         );
                    //       },
                    //     );
                    //   }).toList(),
                    // ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: FutureBuilder<CustomPagesModel?>(
                        future: _loadPages(),
                        builder: (BuildContext context,
                            AsyncSnapshot<CustomPagesModel?> snapshot) {
                          CustomPagesModel? data = snapshot.data;
                          return data != null
                              ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: data.customPages!.length,
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder:
                                  (BuildContext context, int index) {
                                return data.customPages![index].isImage ==
                                    true
                                    ? Stack(
                                  children: [
                                    CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: data
                                          .customPages![index]
                                          .imageSrc
                                          .toString(),
                                      placeholder: (context, url) =>
                                          Center(
                                            child: SizedBox(
                                              height: 50,
                                              width: 50,
                                              child:
                                              CircularProgressIndicator(),
                                            ),
                                          ),
                                      errorWidget:
                                          (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                    Positioned.fill(
                                        child: new Material(
                                            color: Colors.transparent,
                                            child: new InkWell(
                                              onTap: () {
                                                print('Data');
                                              },
                                            )))
                                  ],
                                )
                                    : Container();
                              })
                              : LoadingView();
                        }),
                  ),
                ]),
          ),
        ));
  }
}

Future<CustomPagesModel?> _loadPages() async {
  try {
    CustomPagesModel object = await RequestManager.instance!.getCustomPages();
    return object;
  } catch (e) {
    print("Execption: " + e.toString());
  }
}
