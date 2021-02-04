import 'package:expense_tracker/widgets/tx_List.dart';

import './widgets/new_transactions.dart';
import './models/transaction.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Flutter", home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
  void addTransaction(String txTitle, double txAmount) {
    final newTx = Transactions(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );
    setState(() {
      transactions.add(newTx);
    });
  }

  void addNewTransactionModel(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(addTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expense Tracker'),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () => addNewTransactionModel(context))
          ],
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
              TransactionList(transactions)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => addNewTransactionModel(context),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
