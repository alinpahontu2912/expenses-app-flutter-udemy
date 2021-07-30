import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addTx;

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(10),
        //padding: EdgeInsetsGeometry.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              autocorrect: true,
              controller: titleController,
              cursorColor: Colors.indigo,
              decoration: InputDecoration(
                labelText: 'Enter title of purchase',
              ),
            ),
            TextField(
              autocorrect: true,
              controller: amountController,
              cursorColor: Colors.indigo,
              decoration: InputDecoration(
                labelText: 'Enter price of purchase',
              ),
            ),
            FlatButton(
                textColor: Colors.purple,
                onPressed: () {
                  addTx(titleController.text, double.parse(amountController.text));
                },
                child: Text('Add transaction'))
          ],
        ),
      ),
    );
  }
}
