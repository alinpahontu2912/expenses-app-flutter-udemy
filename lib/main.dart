import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second App Demo', textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
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
          Container(
            child: Card(
              color: Colors.redAccent,
              child: Text('Transaction List'),
            ),
          ),
        ],
      ),
    );
  }
}
