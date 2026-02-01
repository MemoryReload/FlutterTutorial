import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/product.dart';

class ProductsEditPage extends StatefulWidget {
  final Function(Product) addProduct;
  const ProductsEditPage(this.addProduct, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProductsEditPageState();
  }
}

class _ProductsEditPageState extends State<ProductsEditPage> {
  final _productNameController = TextEditingController();
  final _productDescriptionController = TextEditingController();
  final _productPriceController = TextEditingController();

  String _productName = "";
  String _productDescription = "";
  double _productPrice = 0.0;

  @override
  void dispose() {
    _productNameController.dispose();
    _productDescriptionController.dispose();
    _productPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _productNameController,
              autofocus: true,
              decoration: const InputDecoration(labelText: "Product Name"),
              onChanged: (String text) {
                setState(() {
                  _productName = text;
                });
              },
            ),
            TextField(
                controller: _productDescriptionController,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                maxLength: 120,
                maxLines: 3,
                decoration: const InputDecoration(labelText: "Product Description"),
                onChanged: (String text) {
                  setState(() {
                    _productDescription = text;
                  });
                }),
            TextField(
                controller: _productPriceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Product Price"),
                onChanged: (String text) {
                  setState(() {
                    _productPrice = double.tryParse(text) ?? 0.0;
                  });
                }),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Save"),
                    onPressed: () {
                      // Validate inputs
                      if (_productName.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please enter a product name")),
                        );
                        return;
                      }

                      if (_productPrice <= 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please enter a valid price")),
                        );
                        return;
                      }

                      final product = Product(
                        title: _productName,
                        description: _productDescription,
                        price: _productPrice,
                        image: "assets/food.jpg",
                        location: "Union Square, San Francisco",
                      );
                      widget.addProduct(product);
                      Navigator.pushReplacementNamed(context, "/products");
                    },
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
