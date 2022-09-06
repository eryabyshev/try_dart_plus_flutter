import 'package:flutter/material.dart';
import 'package:money_tracker/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<Transaction> transaction = [
    Transaction("t1", "Shoes", 299.9, DateTime.now()),
    Transaction("t2", "Milk", 299.9, DateTime.now()),
  ];

  List<Widget> getTransactionView() {
    return transaction.map((tr) {
      return Card(
        child: Text(tr.title),
      );
    }).toList();
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Card(
              color: Colors.lightBlue,
              child: SizedBox(
                width: double.infinity,
                child: Text("CART!"),
              )),
          Column(
            children: getTransactionView(),
          )
        ],
      ),
    );
  }
}