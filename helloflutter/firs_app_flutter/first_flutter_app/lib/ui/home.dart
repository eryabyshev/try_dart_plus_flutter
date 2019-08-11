import 'package:first_flutter_app/ui/welcome.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Test text"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Welcome(),
    );
  }
}