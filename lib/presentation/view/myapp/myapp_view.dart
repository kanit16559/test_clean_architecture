import 'package:flutter/material.dart';

import '../history/history_view.dart';
import '../home/home_view.dart';
import '../orders/orders_view.dart';
import '../setting/setting_view.dart';

class MyAppView extends StatefulWidget {
  const MyAppView({super.key});

  @override
  State<MyAppView> createState() => _MyAppViewState();
}

class _MyAppViewState extends State<MyAppView> {

  int _selectedPage = 0;
  final _pageOptions = [
    HomeView(),
    HistoryView(),
    OrdersView(),
    SettingView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.document_scanner),
              label: 'Order'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting'
            ),
          ]),
    );
  }


}
