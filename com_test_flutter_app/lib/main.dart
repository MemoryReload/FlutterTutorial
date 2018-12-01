import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import './pages/auth.dart';
import './pages/products.dart';
import './pages/products_admin.dart';
import './pages/product.dart';

void main(List<String> args) {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}
class _MyAppState extends State<MyApp>{

  List <Map<String,String>> _products = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // debugShowMaterialGrid: true,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple,
        ),
        routes: {
          "/": (BuildContext context) => ProductsPage(_products,addProduct,deleteProduct),
          "/admin": (BuildContext contxt) =>
                              ProductManagePage(),
        },
        onGenerateRoute: (RouteSettings settings){
          List<String> pathElements = settings.name.split("/");
          if (pathElements[0].length != 0) return null;
          if (pathElements[1] == "products") {
            int index = int.parse(pathElements[2]);
            return MaterialPageRoute<bool>(
                                          builder: (BuildContext context) =>
                                              ProductPage(
                                                  _products[index]["title"],
                                                  _products[index]["image"]));
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings){
            return MaterialPageRoute<bool>(
                                          builder: (BuildContext context) => AuthPage());
          },
        );
  }

  void addProduct() {
    setState(() {
      _products
          .add({"title": "Advanced food tester", "image": "assets/food.jpg"});
    });
  }

  void deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

}
