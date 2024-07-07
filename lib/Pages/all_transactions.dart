import 'package:flutter/material.dart';
import '../data/data.dart';
import '../widget/transactions.dart';

class AllTransactionsScreen extends StatelessWidget {
  const AllTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Transactions', style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: dummyTransactions.length,
        itemBuilder: (context, index) {
          return BuildTransactionRow(transactions: dummyTransactions[index]);
        },
      ),
    );
  }
}
