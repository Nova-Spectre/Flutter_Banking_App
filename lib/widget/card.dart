import 'package:flutter/material.dart';
import '../model/credit_card.dart';
import '../theme/colors.dart';

class CreditCardWidget extends StatefulWidget {
  final CreditCard creditCard;

  CreditCardWidget({required this.creditCard});

  @override
  _CreditCardWidgetState createState() => _CreditCardWidgetState();
}

class _CreditCardWidgetState extends State<CreditCardWidget> {
  bool _isCardNumberVisible = false;

  void _toggleCardNumberVisibility() {
    setState(() {
      _isCardNumberVisible = !_isCardNumberVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),

        ),
        child: Container(
          height: 215,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.lightPrimaryColor,
                AppColors.lightAccentColor,
                AppColors.lightVioletPinkColor
              ]
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, 8),
              ),
            ],
          ),
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Balance',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.creditCard.balance,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: _toggleCardNumberVisibility,
                            child: Icon(
                              _isCardNumberVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white,
                              size: 23,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    widget.creditCard.cardImage,
                    height: 70,
                    width: 70,
                  ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                _isCardNumberVisible
                    ? widget.creditCard.cardNumber
                    : '**** **** **** ${widget.creditCard.cardNumber.substring(12)}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.creditCard.cardType,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    widget.creditCard.expiryDate,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
