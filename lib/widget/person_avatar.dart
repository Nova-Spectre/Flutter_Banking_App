
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import '../theme/colors.dart';

Widget CustomPersonAvatar({String? imageUrl, IconData? icon, required String name}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            if (icon != null && imageUrl == null)
              DottedBorder(
                borderType: BorderType.Circle,
                dashPattern: [6, 3],
                color:AppColors.lightPrimaryColor,
                strokeWidth: 2,
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.transparent,
                ),
              ),
            CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.lightSecondaryColor,
              child: imageUrl != null
                  ? ClipOval(
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: 60,
                  height: 60,
                ),
              )
                  : Icon(
                icon,
                color: AppColors.lightPrimaryColor,
                size: 30,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          name,
          style: TextStyle(
            fontSize: 14,

          ),
        ),
      ],
    ),
  );
}