import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String imageURL;

  DetailPage(this.title, this.imageURL);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context, false);
           return Future((){
             return false;
           });
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
                    onPressed: () => Navigator.pop(context, true),
                  ),
                ),
              ],
            )));
  }
}
