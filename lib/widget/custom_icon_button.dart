import 'package:flutter/material.dart';
import '../theme/colors.dart';

Widget CustomIconButton(IconData icon, String label) {
  return Column(
    children: [
      InkWell(
        radius: 30,
        borderRadius: BorderRadius.circular(25),
        onTap: (){},
        child: CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.lightSecondaryColor,
          child: Icon(icon, color: AppColors.lightPrimaryColor, size: 30),
        ),
      ),
      SizedBox(height: 8),
      Text(
        label,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
      ),
    ],
  );
}