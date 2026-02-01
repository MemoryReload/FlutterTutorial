import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  const ProductPage(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) {
            return;
          }
          Navigator.pop(context, false);
        },
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Details"),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Material(
                      clipBehavior: Clip.antiAlias,
                      elevation: 5,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Image(
                        image: AssetImage(product.image),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        product.title,
                        style: TextStyle(
                            fontSize: 26,
                            fontFamily: "Oswald",
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          product.location,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 16,
                              fontFamily: "Oswald",
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "|",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 16,
                              fontFamily: "Oswald",
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "\$${product.price}",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 16,
                              fontFamily: "Oswald",
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: const Text(
                          "This is a great product that you will love!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              height: 1.2,
                              color: Colors.grey,
                              fontSize: 18)),
                    ),
                  ],
                ),
              ),
            )));
  }
}
