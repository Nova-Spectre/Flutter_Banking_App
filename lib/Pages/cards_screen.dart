import 'package:flutter/material.dart';
import 'package:neela_banking_ui/widget/card.dart';
import '../model/credit_card.dart';

class CardsScreen extends StatelessWidget {
  final List<CreditCard> creditcards = [
    CreditCard(
      balance: '₹ 25,000,000',
      cardNumber: '4567 7890 5678 2345',
      expiryDate: '09/27',
      cardType: 'Master Card',
      cardImage: 'assets/mastercard.png',
    ),
    CreditCard(
      balance: '₹ 87,000,000',
      cardNumber: '4567 9990 4337 9655',
      expiryDate: '02/29',
      cardType: 'Visa',
      cardImage: 'assets/visa.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Credit Cards',style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: CreditCardWidget(creditCard: creditcards[index]),
            );
          },
          itemCount: creditcards.length,
        ),
      ),
    );
  }
}
