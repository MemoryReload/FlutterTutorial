import 'package:flutter/material.dart';

import './products.dart';
import './products_control.dart';

class ProductsManager extends StatefulWidget {
  final Map<String,String> startingProduct;

  ProductsManager({this.startingProduct});

  @override
  State<StatefulWidget> createState() {
    return _ProductsManagerState();
  }
}

class _ProductsManagerState extends State<ProductsManager> {
  List<Map<String,String>> _products = [];

  @override
  void initState() {
    super.initState();
    if (widget.startingProduct != null) {
      _products.add(widget.startingProduct);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[ProductControl(addProduct), Products(_products)],
    );
  }

  void addProduct() {
    setState(() {
      _products.add({"title":"Advanced food tester","image":"assets/food.jpg"});
    });
  }
}
