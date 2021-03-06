import 'package:flutter/material.dart';
class NewTransaction extends StatefulWidget {
  final Function addTransaction;
  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(){
    final textEntered = titleController.text;
    final amountEntered = double.parse(amountController.text);
    if(textEntered.isEmpty || amountEntered<=0)
    return;
        widget.addTransaction(
              textEntered,
              amountEntered
        );
        Navigator.of(context).pop();              
}

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
                        onSubmitted:(_) => submitData()
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: "Amount"),
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        onSubmitted:(_) => submitData(),
                      ),
                      FlatButton(
                          onPressed: submitData,
                          child: Text(
                            "Add Transaction",
                            style:
                                TextStyle(color: Theme.of(context).primaryColor, fontSize: 15),
                          ))
                    ],
                  ),
                ),
              );
  }
}