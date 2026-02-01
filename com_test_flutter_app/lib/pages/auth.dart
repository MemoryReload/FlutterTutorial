import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final _accountController = TextEditingController();
  final _passwordController = TextEditingController();
  
  late String account;
  late String password;
  late bool accepted;

  @override
  void initState() {
    super.initState();
    accepted = false;
    account = "";
    password = "";
  }

  @override
  void dispose() {
    _accountController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add a logo or header image here if desired
            Icon(
              Icons.account_circle,
              size: 100,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 20),
            Text(
              "Welcome to EasyList",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _accountController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Account", 
                prefixIcon: Icon(Icons.account_box),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.text,
              onChanged: (String text) {
                setState(() {
                  account = text;
                });
              },
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: "Password", 
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              onChanged: (String text) {
                setState(() {
                  password = text;
                });
              },
            ),
            SizedBox(height: 20),
            SwitchListTile(
              title: const Text("Accept Terms"),
              value: accepted,
              onChanged: (bool value) {
                setState(() {
                  accepted = value;
                });
              },
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  // Add validation
                  if (account.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please enter your account")),
                    );
                    return;
                  }
                  
                  if (password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please enter your password")),
                    );
                    return;
                  }
                  
                  if (!accepted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please accept the terms")),
                    );
                    return;
                  }
                  
                  // Navigate to products page
                  Navigator.pushReplacementNamed(context, "/products");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

