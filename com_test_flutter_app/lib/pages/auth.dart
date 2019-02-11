import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String account;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(16, 40, 16, 16),
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                  hintText: "Account", prefixIcon: Icon(Icons.account_box)),
              keyboardType: TextInputType.text,
              onChanged: (String text) {
                account = text;
              },
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Password", prefixIcon: Icon(Icons.keyboard)),
              keyboardType: TextInputType.text,
              obscureText: true,
              onChanged: (String text) {
                password = text;
              },
            ),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text("Login"),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, "/products"),
            ),
          ],
        ),
      ),
    );
  }
}
