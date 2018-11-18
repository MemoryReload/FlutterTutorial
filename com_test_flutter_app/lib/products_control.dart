import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function handler;

  ProductControl(this.handler);

  @override
    Widget build(BuildContext context) {
      return Container(
          margin: EdgeInsets.all(10),
          child: RaisedButton(
            color: Theme.of(context).primaryColor,
              child: Text("Add"),
              onPressed: () {
                handler();
              }),
        );
    }
}