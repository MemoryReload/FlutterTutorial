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
  bool accepted;

  @override
  void initState() {
    super.initState();
    accepted = false;
    account = "";
    password = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop)),
        ),
        padding: EdgeInsets.all(10),
        child: ListView(
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
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Accept Terms"),
                Switch(
                  value: accepted,
                  onChanged: (bool value) {
                    setState(() {
                      accepted = value;
                    });
                  },
                )
              ],
            ),
            SizedBox(
              height: 20,
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
