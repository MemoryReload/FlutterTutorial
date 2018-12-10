import 'package:flutter/material.dart';

class ProductsEditPage extends StatefulWidget {

  final Function addProduct;
  ProductsEditPage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductsEditPageState();
  }
}

class _ProductsEditPageState extends State<ProductsEditPage> {
  String _productName = "";
  String _productDescription = "";
  double _productPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Product Name"),
              onChanged: (String text) {
                _productName = text;
              },
            ),
            TextField(
                maxLengthEnforced: true,
                maxLength: 120,
                maxLines: 3,
                decoration: InputDecoration(labelText: "Product Description"),
                onChanged: (String text) {
                  _productDescription = text;
                }),
            TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Product Price"),
                onChanged: (String text) {
                  _productPrice = double.parse(text);
                }),
                SizedBox(height: 16,),
                RaisedButton(color: Theme.of(context).primaryColor, textColor: Colors.white ,child: Text("Save"), onPressed: (){
                  Map <String, dynamic> product = {
                    "title":_productName,
                    "description":_productDescription,
                    "price":_productPrice,
                    "image":"assets/food.jpg"
                  };
                  widget.addProduct(product);
                  Navigator.pushReplacementNamed(context, "/products");  
                },)
          ],
        ));
  }
}
