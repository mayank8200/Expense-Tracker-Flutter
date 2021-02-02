import 'package:flutter/material.dart';
import './transaction.dart';

void main(List<String> args) {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  final List<Transactions> transactions = [
    Transactions(
        id: "t1",
        title: "New Boult Airpods",
        amount: 1600,
        date: DateTime.now()),
    Transactions(
        id: "t2",
        title: "New CryptoCurrency",
        amount: 1100,
        date: DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Expense Tracker'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  child: Text(
                    "Charts",
                  ),
                  elevation: 10,
                  color: Colors.cyan,
                ),
              ),
              Column(
                children: transactions.map((tx) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            tx.amount.toString(),
                          ),
                        ),
                        Column(
                          children: [
                            Text(tx.title),
                            Text(tx.date.toString())
                          ],
                        )
                      ],
                    ),
                  );
                }).toList(),
              )
            ],
          )),
    );
  }
}
