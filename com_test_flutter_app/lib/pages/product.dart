import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageURL;

  ProductPage(this.title, this.imageURL);

  void _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => WillPopScope(
              onWillPop: () {
                Navigator.pop(context, false);
                return Future.value(false);
              },
              child: AlertDialog(
                title: Text("Are you sure?"),
                content: Text("This action cannot be undone!"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Cancle"),
                    onPressed: () => Navigator.pop(context, false),
                  ),
                  FlatButton(
                    child: Text("Continue"),
                    onPressed: () => Navigator.pop(context, true),
                  ),
                ],
              ),
            )).then((onValue) {
      if (onValue == true) {
        Navigator.pop(context, true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context, false);
          return Future.value(false);
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text("Details"),
            ),
            body: Column(
              children: <Widget>[
                Image(
                  image: AssetImage(imageURL),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(title),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: RaisedButton(
                    child: Text("Delete"),
                    color: Theme.of(context).primaryColor,
                    onPressed: () => _showWarningDialog(context),
                  ),
                ),
              ],
            )));
  }
}
