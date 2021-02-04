import '../models/transaction.dart';
import './tx_List.dart';
import 'package:flutter/material.dart';
import './new_transactions.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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
  void addTransaction(String txTitle, double txAmount)
  {
    final newTx = Transactions(id: DateTime.now().toString(), title: txTitle, amount: txAmount, date: DateTime.now(),);  
    setState(() {
        transactions.add(newTx);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addTransaction),
        TransactionList(transactions)
      ],
    );
  }
}