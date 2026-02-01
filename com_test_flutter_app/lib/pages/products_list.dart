import 'package:flutter/material.dart';

class ProductsListPage extends StatelessWidget {
  const ProductsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.list,
              size: 64,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              "My Products",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "No products added yet",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // This would typically navigate to the create product page
                // For now, we'll show a message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Use the 'Create products' tab to add items")),
                );
              },
              child: Text("Learn How to Add Products"),
            ),
          ],
        ),
    );
  }
}
