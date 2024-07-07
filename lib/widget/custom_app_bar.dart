import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isDarkMode;
  final Function toggleTheme;

  const CustomAppBar({
    Key? key,
    required this.isDarkMode,
    required this.toggleTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 45.0,
                height: 45.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1588701107566-af76b932e2e8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back',
                    style: TextStyle(
                      color: Theme.of(context).appBarTheme.titleTextStyle?.color,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Ballack Jr',
                    style: TextStyle(
                      color: Theme.of(context).appBarTheme.titleTextStyle?.color,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications_none_rounded, color: Theme.of(context).iconTheme.color,size:30),
          onPressed: () {

          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 10);
}
