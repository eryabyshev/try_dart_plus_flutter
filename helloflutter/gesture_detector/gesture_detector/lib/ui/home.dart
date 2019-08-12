import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final title;

  Home({Key key, this.title}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: CustomButton(),
      )
    );
  }

}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = new SnackBar(
            content: Text("Hello Gesture"),
            backgroundColor: Theme.of(context).backgroundColor,
            duration: Duration(seconds: 2)
        );

        Scaffold.of(context).showSnackBar(snackBar);
      },

      child: Container(
        padding: EdgeInsets.all(18.0),
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(5.5)
        ),
        child: Text("Firs button"),
      ),
    );
  }
}