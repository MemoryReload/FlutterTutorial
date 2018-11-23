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
            Container(
              padding: EdgeInsets.all(10),
              child: Text("product"),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                child: Text("goBack"),
                color: Theme.of(context).primaryColor,
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ));
  }
}
