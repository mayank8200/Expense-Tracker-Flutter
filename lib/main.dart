import './widgets/user_transactions.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Expense Tracker'),
          ),
          body: SingleChildScrollView(
                      child: Column(
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
                UserTransactions()
              ],
            ),
          )),
    );
  }
}
