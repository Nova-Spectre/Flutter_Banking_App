import 'package:flutter/material.dart';
import '../model/transactions.dart';
import '../widget/receipt_details.dart';
import '../theme/colors.dart';

class ReceiptScreen extends StatelessWidget {
  final Transactions transaction;

  ReceiptScreen({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightBackgroundColor,
        elevation: 0,
        title: Text('Receipt',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.lightSecondaryColor,
              child: Icon(Icons.arrow_back)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage('https://media.istockphoto.com/id/908231976/photo/bearded-young-man-with-hat.jpg?s=2048x2048&w=is&k=20&c=wmi6raZUTtEQkxKHN_CzlxvN4ScisIuQbWtfjaIp_HM='), // Replace with actual image URL
                    ),
                    SizedBox(height: 16),
                    Text(
                      '₹${transaction.amount.abs().toStringAsFixed(0)}',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      transaction.receiver,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.lightTextColor,
                      ),
                    ),
                    Text(
                      transaction.receiverDetails,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        transaction.note,
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    Divider(
                      height: 30,
                      thickness: 1,
                      color: Colors.grey[300],
                    ),
                    ReceiptDetail(title: 'Status', value: transaction.status, valueColor: Colors.green),
                    ReceiptDetail(title: 'Date', value: '${transaction.tnsDate.day} ${getMonthName(transaction.tnsDate.month)} ${transaction.tnsDate.year}'),
                    ReceiptDetail(title: 'Time', value: transaction.time.format(context)),
                    ReceiptDetail(
                      title: 'Transaction ID',
                      value: transaction.tnsId,
                      isCopyable: true,
                    ),
                    ReceiptDetail(title: 'Tax', value: '₹${transaction.tax.toStringAsFixed(0)}'),
                    Divider(thickness: 1, height: 32),

                    ReceiptDetail(title: 'Total', value: '₹${transaction.total.toStringAsFixed(0)}', isBold: true),


                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.ios_share),
              label: Text('Share Receipt'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {},
              child: Text('Close'),
              style: OutlinedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ],
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
