import 'package:flutter/material.dart';
import './products.dart';

class ProductsManager extends StatefulWidget {
  final String startingProduct;

  ProductsManager({this.startingProduct});

  @override
  State<StatefulWidget> createState() {
    return _ProductsManagerState();
  }
}

class _ProductsManagerState extends State<ProductsManager> {
  List<String> _products = [];

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
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
                child: Center(
                    child: Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child: Text("Add"),
                  onPressed: () {
                    setState(() {
                      _products.add("Advenced food tester");
                    });
                  }),
            ))),
          ],
        ),
        Products(_products)
      ],
    );
  }
}
