import 'package:flutter/material.dart';
import 'package:secondapp/widgets/user_transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second App Demo', textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body:  Column(
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
            UserTransaction(),
          ],
        ),

    );
  }
}
