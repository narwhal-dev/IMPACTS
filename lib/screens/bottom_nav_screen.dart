import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:flutter/material.dart';
import 'package:impacts/config/palette.dart';
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
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Palette.tabBackground,
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
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
        currentIndex: _selectedIndex,
        selectedItemColor: Palette.textColor2,
        selectedLabelStyle: Styles.subheading,
        unselectedItemColor: Palette.textColor3,
        unselectedLabelStyle: Styles.subheading,
        onTap: (index) {
          setState((){
            _selectedIndex = index;
          });
        }
      ),
    );
  }
}
