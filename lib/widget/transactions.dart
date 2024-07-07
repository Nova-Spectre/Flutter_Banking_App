import 'package:flutter/material.dart';
import '../model/transactions.dart';
import '../Pages/receipt.dart';

class BuildTransactionRow extends StatelessWidget {
  final Transactions transactions;

  BuildTransactionRow({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReceiptScreen(transaction: transactions),
          ),
        );
      },
      child: ListTile(
        leading: Icon(Icons.credit_card_sharp),
        title: Text(transactions.receiver, style: TextStyle(fontSize: 16)),
        subtitle: Text(
          '${transactions.tnsDate.day} ${getMonthName(transactions.tnsDate.month)} ${transactions.tnsDate.year} - ${transactions.time.format(context)}',
          style: TextStyle(color: Colors.grey),
        ),
        trailing: Text(
          transactions.amount > 0 ? '+₹${transactions.amount.toStringAsFixed(3)}' : '-₹${(-transactions.amount).toStringAsFixed(3)}',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: transactions.amount > 0 ? Colors.green : Colors.red),
        ),
      ),
    );
  }
}

String getMonthName(int monthNumber) {
  const months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];
  return months[monthNumber - 1];
}
