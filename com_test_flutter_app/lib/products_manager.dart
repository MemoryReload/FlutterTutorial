import 'package:flutter/material.dart';

class ProductsManager extends StatelessWidget {
  final Function _clickCallBack;
  ProductsManager(this._clickCallBack);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: RaisedButton(
          child: Text("Add"),
          onPressed: () {
            _clickCallBack();
          }),
    );
  }
}
