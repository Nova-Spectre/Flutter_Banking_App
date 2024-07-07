import 'package:flutter/material.dart';
import 'package:neela_banking_ui/Pages/all_transactions.dart';
import 'package:neela_banking_ui/Pages/cards_screen.dart';
import 'package:neela_banking_ui/Pages/home_screen.dart';
import 'package:neela_banking_ui/widget/bottom_nav_bar.dart';
import 'package:neela_banking_ui/widget/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final Function toggleTheme;

  const HomePage({Key? key, required this.isDarkMode, required this.toggleTheme}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _navigateToAllTransactions() {
    setState(() {
      _selectedIndex = 1;
    });
  }


  static List<Widget> _widgetOptions(BuildContext context, Function navigateToAllTransactions) => <Widget>[
    HomeScreen(navigateToAllTransactions: navigateToAllTransactions),
    AllTransactionsScreen(),
    CardsScreen(),
    Text('Profile Page'),
  ];

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(isDarkMode: widget.isDarkMode,
        toggleTheme: widget.toggleTheme),
      body: Center(
        child:  _widgetOptions(context, _navigateToAllTransactions).elementAt(_selectedIndex),
      ),
      bottomNavigationBar: screenWidth > 600
          ? null
          : BottomWidgetBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
