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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                child: Text("Charts",),
                elevation: 10,
                color: Colors.cyan,
              ),
            ),
            Card(
              child: Text("Expenses"),
              color: Colors.amber,
            )
          ],
        )        
        ),
      );
    
  }
}
