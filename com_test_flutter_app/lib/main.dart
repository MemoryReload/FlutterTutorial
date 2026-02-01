import 'package:flutter/material.dart';

import './models/product.dart';
// import 'package:flutter/rendering.dart';

import './pages/auth.dart';
import './pages/products.dart';
import './pages/products_admin.dart';
import './pages/product.dart';
import './pages/not_found.dart';

const String routeAuth = '/';
const String routeProducts = '/products';
const String routeAdmin = '/admin';
const String routeProduct = '/product';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final List<Product> _products = [
    Product(
      title: "Italian Salad",
      image: "assets/food.jpg",
      price: 20.0,
      location: "Union Square, San Francisco",
      description: "Fresh Italian salad with mixed greens, tomatoes, and balsamic dressing"
    ),
    Product(
      title: "Vegetable Curry",
      image: "assets/food.jpg",
      price: 25.0,
      location: "Downtown, Los Angeles",
      description: "Delicious vegetable curry with aromatic spices and fresh vegetables"
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyList',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepOrange,
        ).copyWith(
          secondary: Colors.deepPurple,
        ),
      ),
      routes: {
        routeAuth: (BuildContext context) => const AuthPage(),
        routeProducts: (BuildContext context) =>
            ProductsPage(products: _products, deleteProduct: deleteProduct),
        routeAdmin: (BuildContext context) => ProductManagePage(addProduct),
      },
      initialRoute: routeProducts,
      onGenerateRoute: (RouteSettings settings) {
        final pathElements = settings.name?.split('/');
        if (pathElements == null || pathElements.length < 3 || pathElements[1] != 'products') {
          return null;
        }
        final index = int.tryParse(pathElements[2]);
        if (index == null || index < 0 || index >= _products.length) {
          return null;
        }
        return MaterialPageRoute<bool>(
          builder: (BuildContext context) => ProductPage(_products[index]),
        );
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<bool>(
            builder: (BuildContext context) => const AuthPage());
      },
    );
  }

  void addProduct(Product product) {
    setState(() {
      _products.add(product);
    });
  }

  void deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }
}
