import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function deleteProduct;

  Products([this.products = const [], this.deleteProduct]);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => Card(
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage(products[index]["image"]),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(products[index]["title"],
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Condensed_Bold")),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            "\$${products[index]["price"].toString()}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      FlatButton(
                          child: Text("Details"),
                          onPressed: () =>
                              Navigator.pushNamed(context, "/products/$index")
                                  .then((result) {
                                if (result) {
                                  deleteProduct(index);
                                }
                              })),
                    ],
                  )
                ],
              ),
            ),
        itemCount: products.length,
      ).build(context),
    );
  }
}
