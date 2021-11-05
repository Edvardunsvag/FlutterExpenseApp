import 'package:first_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 330,
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text('The list is empty'),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 250,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            : SizedBox(
                height: 300,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            )),
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              '\$: ${transactions[index].amount.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(transactions[index].title,
                                  style: Theme.of(context)
                                      .appBarTheme
                                      .titleTextStyle),
                              Text(
                                DateFormat.yMMMd()
                                    .format(transactions[index].date),
                                style: TextStyle(
                                  color: Colors.grey,
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
              ));
  }
}
