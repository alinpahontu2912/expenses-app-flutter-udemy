import 'package:flutter/material.dart';
import 'package:secondapp/widgets/Chart.dart';
import 'package:secondapp/widgets/new_transaction.dart';
import 'package:secondapp/widgets/transaction_list.dart';

import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal expenses',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.lightGreen,
        errorColor: Colors.redAccent,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
              button: TextStyle(color: Colors.white)
                )),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTracsanctions {
    return _userTransactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: chosenDate);
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id){
      setState(() {
        _userTransactions.removeWhere((element) => element.id == id);
      });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Expenses',
          style: TextStyle(fontFamily: 'OpenSans'),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            child: Chart(_recentTracsanctions),
            elevation: 5,
            color: Colors.brown,
          ),
          TransactionList(_userTransactions, _deleteTransaction),
        ],
      ),
    );
  }
}
