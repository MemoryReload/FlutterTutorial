import 'dart:async';

import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductPage(this.product);

  // void _showWarningDialog(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) => WillPopScope(
  //             onWillPop: () {
  //               Navigator.pop(context, false);
  //               return Future.value(false);
  //             },
  //             child: AlertDialog(
  //               title: Text("Are you sure?"),
  //               content: Text("This action cannot be undone!"),
  //               actions: <Widget>[
  //                 FlatButton(
  //                   child: Text("Cancle"),
  //                   onPressed: () => Navigator.pop(context, false),
  //                 ),
  //                 FlatButton(
  //                   child: Text("Continue"),
  //                   onPressed: () => Navigator.pop(context, true),
  //                 ),
  //               ],
  //             ),
  //           )).then((onValue) {
  //     if (onValue == true) {
  //       Navigator.pop(context, true);
  //     }
  //   });
  // }

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
                Container(
                  child: Image(
                    image: AssetImage(product["image"]),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    product["title"],
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: "Oswald",
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                Expanded(
                  child: ListView(children: <Widget>[
                    ListTile(
                      title: Text("Price"),
                      subtitle: Text(product["price"].toString()),
                    ),
                    ListTile(
                      title: Text("Adress"),
                      subtitle: Text("Union Square, Los Angels"),
                    ),
                    ListTile(
                      title: Text("Description"),
                      subtitle: Text(product["description"]),
                    ),
                  ]),
                ),
              ],
            )));
  }
}
