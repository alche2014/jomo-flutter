import 'package:flutter/material.dart';
import 'package:jomo_flutter/Activities/ProductsById.dart';
import 'package:jomo_flutter/Activities/ProductsByTag.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(child: ProductIDScreen(graphId: "Z2lkOi8vc2hvcGlmeS9Db2xsZWN0aW9uLzIzOTM2NzU1MzE5OQ==",));
    // return Container(child: ProductTagScreen(tag: " ",));
  }
}
