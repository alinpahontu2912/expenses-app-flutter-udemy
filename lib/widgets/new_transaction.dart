import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

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
              cursorColor: Theme.of(context).primaryColor,
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(
                labelText: 'Enter title of purchase',
              ),
            ),
            TextField(
              autocorrect: true,
              controller: amountController,
              cursorColor: Colors.indigo,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(
                labelText: 'Enter price of purchase',
              ),
            ),
            Container(
              height: 50,
              child: Row(
                children: [
                  Text('No date chosen!'),
                  RaisedButton(
                      textColor: Theme.of(context).primaryColor,
                      onPressed: () {},
                      child: Text('Choose Date!', style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),))
                ],
              ),
            ),
            RaisedButton(
              color: Theme.of(context).buttonColor,
                textColor: Theme.of(context).primaryColor,
                onPressed: () => submitData,
                child: Text('Add transaction'))
          ],
        ),
      ),
    );
  }
}
