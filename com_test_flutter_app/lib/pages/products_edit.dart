import 'package:flutter/material.dart';

class ProductsEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          child: Text("Save"),
          onPressed: () => showModalBottomSheet(
              context: context, builder: (BuildContext context) => Center(child: Text("This is a Modal!"),)),
        ),
      ),
    );
  }
}
