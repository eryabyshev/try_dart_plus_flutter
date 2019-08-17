import 'package:flutter/material.dart';
import 'package:login_app/ui/login.dart';

main() => runApp(Login());

class Login extends StatelessWidget {

  final appTitle = 'Login';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
          appBar: PreferredSize(
            child: AppBar(
              title: Text(appTitle),
              centerTitle: true,
            ),
            preferredSize: Size.fromHeight(30),
          ),
        backgroundColor: Colors.white70,
        body: LoginForm(),

      ),
    );
  }
}
