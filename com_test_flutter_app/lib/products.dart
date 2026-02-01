import 'package:flutter/material.dart';

import './models/product.dart';

class Products extends StatelessWidget {
  final List<Product> products;
  final Function deleteProduct;

  const Products({Key? key, this.products = const [], required this.deleteProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => Card(
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage(products[index].image),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(products[index].title,
                          style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Oswald")),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2.5),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "\$${products[index].price.toString()}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                          width: 1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    child: Text(products[index].location),
                  ),
                ),
                OverflowBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        icon: const Icon(Icons.info),
                        color: Theme.of(context).colorScheme.secondary,
                        onPressed: () =>
                            Navigator.pushNamed(context, "/products/$index")
                                .then((result) {
                              if (result == true) {
                                deleteProduct(index);
                              }
                            })),
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        // TODO: Implement favorite functionality
                      },
                    )
                  ],
                )
              ],
            ),
          ),
      itemCount: products.length,
    );
  }
}
