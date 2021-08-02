import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  DateTime _selectedDate = DateTime(1990);

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty ||
        enteredAmount <= 0 ||
        _selectedDate == DateTime(1990)) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == DateTime(1990)) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate!;
      });
    });
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
              controller: _titleController,
              cursorColor: Theme.of(context).primaryColor,
              onSubmitted: (_) => _submitData(),
              decoration: InputDecoration(
                labelText: 'Enter title of purchase',
              ),
            ),
            TextField(
              autocorrect: true,
              controller: _amountController,
              cursorColor: Colors.indigo,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              decoration: InputDecoration(
                labelText: 'Enter price of purchase',
              ),
            ),
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Text(_selectedDate == DateTime(1990)
                        ? 'No date chosen!'
                        : DateFormat.yMd().format(_selectedDate).toString()),
                  ),
                  RaisedButton(
                      textColor: Theme.of(context).primaryColor,
                      onPressed: _presentDatePicker,
                      child: Text(
                        'Choose Date!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                ],
              ),
            ),
            RaisedButton(
                color: Theme.of(context).buttonColor,
                textColor: Theme.of(context).primaryColor,
                onPressed: () => _submitData,
                child: Text('Add transaction'))
          ],
        ),
      ),
    );
  }
}
