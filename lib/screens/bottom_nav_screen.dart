import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'dart:ui';
import 'package:impacts/config/styles.dart';
import 'home_screen.dart';
import 'qr_screen.dart';
import 'history_screen.dart';
import 'settings_screen.dart';

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
                filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor.withOpacity(0.7),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 25.0, top: 2.0, right: 25.0, bottom: 0.0),
                    child: BottomNavigationBar(
                      elevation: 0,
                      type: BottomNavigationBarType.fixed,
                      backgroundColor: Colors.transparent,
                      iconSize: 30,
                      items: [
                        BottomNavigationBarItem(
                            icon: Icon(SFSymbols.house_fill),
                            label: 'Home',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(SFSymbols.square_grid_2x2),
                          label: 'QR Code',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.history),
                          label: 'History',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(SFSymbols.gear_alt),
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
        ),
      ],
    );
  }
}
