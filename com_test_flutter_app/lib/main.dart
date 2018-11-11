import 'package:flutter/material.dart';

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
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                child: Text("Add"),
                onPressed: () {
                  print(_products);
                  setState(() {
                    _products.add("Advanced Food");
                  });
                }),
              ),
            Column(
              children: _products
                  .map((element) => Card(
                        child: Column(
                          children: <Widget>[
                            Image(
                              image: AssetImage("assets/food.jpg"),
                            ),
                            Text(element),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}