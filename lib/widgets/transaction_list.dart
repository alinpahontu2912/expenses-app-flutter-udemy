import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:secondapp/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text('No transaction added yet!',
                    style: Theme.of(context).textTheme.headline6),
                SizedBox(height: 20,),
                Container(
                  height: 200,
                    child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                )),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          //tx.amount.toString() + '\$',
                          '${transactions[index].amount.toStringAsFixed(2)}\$',
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
                              color: Theme.of(context).primaryColorDark,
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
                            transactions[index].title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat('MM-dd-yy')
                                .format(transactions[index].date),
                            style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
