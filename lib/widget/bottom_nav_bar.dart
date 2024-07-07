import 'package:flutter/material.dart';
import 'package:neela_banking_ui/theme/colors.dart';

class BottomWidgetBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomWidgetBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  _BottomWidgetBarState createState() => _BottomWidgetBarState();
}

class _BottomWidgetBarState extends State<BottomWidgetBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card),
          label: 'Card',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: AppColors.lightPrimaryColor,
      unselectedItemColor: AppColors.lightTextColor.withOpacity(0.6),
      onTap: widget.onItemTapped,
    );
  }
}
