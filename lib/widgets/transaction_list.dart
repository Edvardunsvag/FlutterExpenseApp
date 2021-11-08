import 'package:first_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;
  final Function deleteTransations;

  TransactionList(this.transactions, this.deleteTransations);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 450,
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
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 5,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: FittedBox(
                                child: Text('\$${transactions[index].amount}')),
                          ),
                        ),
                        title: Text(transactions[index].title,
                            style: Theme.of(context).textTheme.headline6),
                        subtitle: Text(
                          DateFormat.yMMMd().format(transactions[index].date),
                        ),
                        trailing: TextButton(
                          child: Text('Delete'),
                          onPressed: () => deleteTransations(index),
                        ),
                      ),
                    );
                  },
                  itemCount: transactions.length,
                ),
              ));
  }
}
