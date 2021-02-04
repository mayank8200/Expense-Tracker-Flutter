import 'package:flutter/material.dart';
class NewTransaction extends StatelessWidget {
  final Function addTransaction;
  NewTransaction(this.addTransaction);
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  void submitData(){
    final textEntered = titleController.text;
    final amountEntered = double.parse(amountController.text);
    if(textEntered.isEmpty || amountEntered<=0)
    return;
        addTransaction(
              textEntered,
              amountEntered
        );              
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
                                TextStyle(color: Colors.purple, fontSize: 15),
                          ))
                    ],
                  ),
                ),
              );
  }
}