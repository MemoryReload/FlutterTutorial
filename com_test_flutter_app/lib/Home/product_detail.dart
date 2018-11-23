import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Details"),
        ),
        body: Column(
          children: <Widget>[
            Image(
              image: AssetImage("assets/food.jpg"),
            ),
            Text("product"),
            FlatButton(
              child: Text("goBack"),
              color: Theme.of(context).accentColor,
              onPressed: () => Navigator.pop(context),
            )
          ],
        ));
  }
}
