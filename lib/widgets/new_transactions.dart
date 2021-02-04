import 'package:flutter/material.dart';
class NewTransaction extends StatelessWidget {
  final Function addTransaction;
  NewTransaction(this.addTransaction);
  final titleController = TextEditingController();
  final amountController = TextEditingController();
    @override
  Widget build(BuildContext context) {
    return Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextField(
                        decoration: InputDecoration(labelText: "Title"),
                        controller: titleController,
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: "Amount"),
                        controller: amountController,
                      ),
                      FlatButton(
                          onPressed: () {
                            addTransaction(titleController.text,
                                    double.parse(amountController.text) 
                            );
                            
                          },
                          child: Text(
                            "Add Transaction",
                            style:
                                TextStyle(color: Colors.purple, fontSize: 15),
                          ))
                    ],
                  ),
                ),
              );
  }
}