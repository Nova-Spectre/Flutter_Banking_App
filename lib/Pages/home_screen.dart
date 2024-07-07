import 'package:flutter/material.dart';

import '../data/data.dart';
import '../model/credit_card.dart';
import '../widget/card.dart';
import '../widget/custom_icon_button.dart';
import '../widget/person_avatar.dart';
import '../widget/transactions.dart';

class HomeScreen extends StatelessWidget {
  final Function navigateToAllTransactions;
  HomeScreen({required this.navigateToAllTransactions});

  final CreditCard creditCards =
  CreditCard(
    balance: '₹ 25,000,000',
    cardNumber: '4567 7890 5678 2345',
    expiryDate: '09/27',
    cardType: 'Master Card',
    cardImage: 'assets/mastercard.png',
  );


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CreditCardWidget(creditCard: creditCards),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomIconButton(Icons.account_balance_wallet, 'Top up'),
                CustomIconButton(Icons.send, 'Send'),
                CustomIconButton(Icons.request_page, 'Request'),
                CustomIconButton(Icons.more_horiz, 'More'),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Quick Transfer',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomPersonAvatar( icon:Icons.add, name:'Add'),
                  CustomPersonAvatar(name:'Maria', imageUrl: 'https://images.unsplash.com/photo-1592169813474-dd0c8e52e3bf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),
                  CustomPersonAvatar(name:'Brian', imageUrl: 'https://images.unsplash.com/photo-1597890928584-23b06b3af251?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
                  CustomPersonAvatar(name:'Chloe', imageUrl: 'https://images.unsplash.com/photo-1599139497043-042b5c90db45?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),
                  CustomPersonAvatar(name:'Shawn', imageUrl: 'https://images.unsplash.com/photo-1616146552651-f0aa176c0d38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80'),
                  CustomPersonAvatar(name:'Brian', imageUrl: 'https://images.unsplash.com/photo-1592169813474-dd0c8e52e3bf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),
                  CustomPersonAvatar(name:'Chloe', imageUrl: 'https://images.unsplash.com/photo-1592169813474-dd0c8e52e3bf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),
                  CustomPersonAvatar(name:'Shawn', imageUrl: 'https://images.unsplash.com/photo-1592169813474-dd0c8e52e3bf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80'),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Transaction',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () => navigateToAllTransactions(),
                  child: Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Column(
              children:dummyTransactions.take(7).map((transaction) {
                return BuildTransactionRow(transactions: transaction);
              }).toList(),

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

