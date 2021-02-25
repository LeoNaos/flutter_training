import 'package:flutter/material.dart';
import 'package:flutter_app_day3/modules/HomeTabbar/navigators/home_tabbar_navigator.dart';
import 'package:flutter_app_day3/modules/HomeTabbar/navigators/profile_tabbar_navigator.dart';
import 'package:flutter_app_day3/modules/userprofile/pages/profile_food_page.dart';
import 'package:flutter_app_day3/modules/userprofile/pages/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: ProfileFoodPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.free_breakfast),
              label: 'Profile',
            )
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            HomeTabbarNavigator(),
            ProfileTabbarNavigator(),
          ],
        ),
      ),
    );
  }
}
