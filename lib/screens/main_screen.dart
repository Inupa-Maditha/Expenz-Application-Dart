import 'package:expence_app/constants/colors.dart';
import 'package:expence_app/screens/add_new_screen.dart';
import 'package:expence_app/screens/budget_screen.dart';
import 'package:expence_app/screens/home_screen.dart';
import 'package:expence_app/screens/profile_screen.dart';
import 'package:expence_app/screens/transactions_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List displayPage = <Widget>[
    BudgetScreen(),
    HomeScreen(),
    TransactionsScreen(),
    AddNewScreen(),
    //BudgetScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kWhiteColor.withAlpha(150),
        selectedItemColor: kMainColor,
        unselectedItemColor: kGrayColor,
        selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list_rounded), label: "Transactions"),
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(shape: BoxShape.circle, color: kMainColor),
              child: Icon(
                (_currentIndex == 2) ? Icons.add : Icons.add_circle_outlined,
                size: 30,
                color: kWhiteColor,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.rocket), label: "Budget"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: displayPage[_currentIndex],
    );
  }
}
