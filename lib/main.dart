import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

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
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  child: Text(
                    "Charts",
                  ),
                  elevation: 5,
                  color: Colors.cyan,
                ),
              ),
              Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextField(
                        decoration: InputDecoration(labelText: "Title"),
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: "Amount"),
                      ),
                      FlatButton(
                          onPressed: () => {},
                          child: Text(
                            "Add Transaction",
                            style:
                                TextStyle(color: Colors.purple, fontSize: 15),
                          ))
                    ],
                  ),
                ),
              ),
              Column(
                children: transactions.map((tx) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(25),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.purple,
                              width: 3,
                            ),
                          ),
                          child: Text(
                            '₹ ${tx.amount}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tx.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              DateFormat.yMMMEd().format(tx.date),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
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
