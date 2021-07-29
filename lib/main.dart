import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:secondapp/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: '01', title: 'dummy', amount: 12.43, date: DateTime.now()),
    Transaction(id: '02', title: 'test', amount: 14.01, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second App Demo', textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            child: Container(
              child: Text(
                'CHART Placeholder',
                textAlign: TextAlign.center,
              ),
              width: double.infinity,
            ),
            elevation: 5,
            color: Colors.brown,
          ),
          Card(
            elevation: 5,
            child: Container(
              margin: EdgeInsets.all(10),
              //padding: EdgeInsetsGeometry.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    autocorrect: true,
                    cursorColor: Colors.indigo,
                    decoration: InputDecoration(
                      labelText: 'Enter title of purchase',
                    ),
                  ),
                  TextField(
                    autocorrect: true,
                    cursorColor: Colors.indigo,
                    decoration: InputDecoration(
                      labelText: 'Enter price of purchase',
                    ),
                  ),
                  FlatButton(
                    textColor: Colors.purple,
                      onPressed: () => null, child: Text('Add transaction'))
                ],
              ),
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        //tx.amount.toString() + '\$',
                        '${tx.amount}\$',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          ),
                          color: Colors.white54),
                      padding: EdgeInsets.all(10),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat('MM-dd-yy').format(tx.date),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
