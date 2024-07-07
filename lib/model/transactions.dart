import 'package:flutter/material.dart';

class Transactions {
  final String receiver;
  final DateTime tnsDate;
  final double amount;
  final String status;
  final String tnsId;
  final String note;
  final TimeOfDay time;
  final double tax;
  final double total;
  final String receiverDetails;

  Transactions({
    required this.receiver,
    required this.tnsDate,
    required this.amount,
    required this.status,
    required this.tnsId,
    required this.note,
    required this.time,
    required this.tax,
    required this.total,
    required this.receiverDetails,
  });
}
