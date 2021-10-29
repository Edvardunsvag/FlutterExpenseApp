import 'dart:ffi';

import 'package:first_app/widgets/new_transaction.dart';
import 'package:first_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: _MyHomePageState(),
    );
  }
}

class _MyHomePageState extends StatefulWidget {
  @override
  State<_MyHomePageState> createState() => _MyHomePageStateState();
}

class _MyHomePageStateState extends State<_MyHomePageState> {
  final List<Transactions> _userTransactions = [
    Transactions(
      id: 't1',
      title: 'new shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transactions(
      id: 't2',
      title: 'Weekly food',
      amount: 24.99,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transactions(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => startAddNewTransaction(context)),
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: Card(
              child: Text('Chart'),
              elevation: 5,
            ),
          ),
          TransactionList(_userTransactions),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => startAddNewTransaction(context)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
