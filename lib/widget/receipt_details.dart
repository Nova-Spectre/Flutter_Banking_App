import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/colors.dart';
class ReceiptDetail extends StatelessWidget {

  final String title;
  final String value;
  final bool isBold;
  final bool isCopyable;
  final Color valueColor;

  ReceiptDetail({
    required this.title,
    required this.value,
    this.isBold = false,
    this.isCopyable = false,
    this.valueColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, color: AppColors.lightgreytextColor),
          ),
          Row(
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  color: valueColor,
                ),
              ),
              if (isCopyable)
                IconButton(
                  icon: Icon(Icons.copy, size: 16, color: Colors.grey),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: value));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Copied to clipboard'),
                      duration: Duration(seconds: 3),
                    ));


                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}