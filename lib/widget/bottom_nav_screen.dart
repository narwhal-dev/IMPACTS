import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import '../config/styles.dart';
import '../screens/home_screen.dart';
import '../screens/dashboard_screen.dart';
import '../screens/history_screen.dart';
import '../screens/settings_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;
  final List _screens = [
    Home(),
    QRPage(),
    History(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0.0,
            brightness: Theme.of(context).appBarTheme.brightness,
            backgroundColor: Colors.transparent,
          ),
        ),
        Scaffold(
          extendBody: true,
          body: _screens[_selectedIndex],
          bottomNavigationBar: Align(
            alignment: FractionalOffset.bottomCenter,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor.withOpacity(0.7),
                  ),
                  padding: EdgeInsets.only(left: 25.0, top: 2.0, right: 25.0, bottom: 0.0),
                  child: BottomNavigationBar(
                    elevation: 0,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.transparent,
                    iconSize: 30,
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.house_fill),
                          label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.dashboard),
                        label: 'QR Code',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.hourglass),
                        label: 'History',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.gear_alt),
                        label: 'Settings',
                      ),
                    ],
                    showUnselectedLabels: true,
                    currentIndex: _selectedIndex,
                    selectedItemColor: Theme.of(context).indicatorColor,
                    unselectedItemColor: Theme.of(context).iconTheme.color,
                    selectedLabelStyle: Styles.subheading,
                    unselectedLabelStyle: Styles.subheading,
                    onTap: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
