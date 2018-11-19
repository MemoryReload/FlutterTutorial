import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function handler;

  ProductControl(this.handler);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            child: Center(
                child: Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          child: RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text("Add"),
              onPressed: () {
                handler();
              }),
        ))),
      ],
    );
  }
}
