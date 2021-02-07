import './widgets/charts.dart';
import './widgets/new_transactions.dart';
import './models/transaction.dart';
import 'package:flutter/material.dart';
import './widgets/tx_List.dart';

void main(List<String> args) {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense Tracker", 
     
      home: MyHomePage()
      );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transactions> transactions = [
    // Transactions(
    //     id: "t1",
    //     title: "New Boult Airpods",
    //     amount: 1600,
    //     date: DateTime.now()),
    // Transactions(
    //     id: "t2",
    //     title: "New CryptoCurrency",
    //     amount: 1100,
    //     date: DateTime.now())
  ];
 List<Transactions> get recentTransactions{
   return transactions.where((tx) {
     return tx.date.isAfter(
       DateTime.now().subtract(Duration(days: 7))
     );
   }).toList();
 }

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
       theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: "OpenSans",
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: "OpenSans",
              fontSize: 18,
              fontWeight: FontWeight.bold
              )
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: "OpenSans",
              fontSize: 20,
              fontWeight: FontWeight.bold
              )
          )
        )
        //accentColor: Colors.green
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expense Tracker'),
          //backgroundColor: Theme.of(context).primaryColor,
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
             Charts(recentTransactions),
              TransactionList(transactions)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          //backgroundColor: Theme.of(context).primaryColor,
          onPressed: () => addNewTransactionModel(context),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
