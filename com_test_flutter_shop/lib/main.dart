import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Products(),
      child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.purple,
            ).copyWith(
              secondary: Colors.deepOrange,
            ),
            fontFamily: 'Lato',
          ),
          home: const ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
          }),
    );
  }
}
