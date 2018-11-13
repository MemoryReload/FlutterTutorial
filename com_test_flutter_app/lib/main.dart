import 'package:flutter/material.dart';
import './products.dart';
import './products_manager.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<String> _products = ["Food Paradise"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("EasyList"),
        ),
        body: Column(
          children: <Widget>[ProductsManager(addProduct), Products(products: _products,)],
        ),
      ),
    );
  }

  addProduct() {
    print(_products);
    setState(() {
      _products.add("Advanced Food");
    });
  }
}
