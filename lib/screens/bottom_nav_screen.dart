import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'dart:ui';
import 'package:impacts/config/palette.dart';
import 'package:impacts/config/styles.dart';
import 'home_screen.dart';
import 'qr_screen.dart';
import 'history_screen.dart';
import 'settings_screen.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

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
      extendBody: true,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Align(
        alignment: FractionalOffset.bottomCenter,

        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
            child: Container(
              decoration: BoxDecoration(
                color: Palette.tabBackground.withOpacity(0.7),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 12.0, top: 3.0, right: 12.0, bottom: 0.0),
                child: BubbleBottomBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  currentIndex: _selectedIndex,
                  onTap: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  hasNotch: true,
                  opacity: 0.8,
                  hasInk: true,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  items: <BubbleBottomBarItem>[
                    BubbleBottomBarItem(
                      backgroundColor: Palette.textColor2,
                      icon: Icon(
                        SFSymbols.house,
                        color: Palette.textColor3,
                      ),
                      activeIcon: Icon(
                        SFSymbols.house_fill,
                        color: Palette.tabBackground,
                      ),
                      title: Text("Home", style: Styles.paragraph),
                    ),
                    BubbleBottomBarItem(
                      backgroundColor: Palette.textColor2,
                      icon: Icon(
                        SFSymbols.square_grid_2x2,
                        color: Palette.textColor3,
                      ),
                      activeIcon: Icon(
                        SFSymbols.square_grid_2x2,
                        color: Palette.tabBackground,
                      ),
                      title: Text("QR Code", style: Styles.paragraph),
                    ),
                    BubbleBottomBarItem(
                      backgroundColor: Palette.textColor2,
                      icon: Icon(
                        Icons.history,
                        color: Palette.textColor3,
                      ),
                      activeIcon: Icon(
                        Icons.history,
                        color: Palette.tabBackground,
                      ),
                      title: Text("History", style: Styles.paragraph),
                    ),
                    BubbleBottomBarItem(
                      backgroundColor: Palette.textColor2,
                      icon: Icon(
                        SFSymbols.gear_alt,
                        color: Palette.textColor3,
                      ),
                      activeIcon: Icon(
                        SFSymbols.gear_alt,
                        color: Palette.tabBackground,
                      ),
                      title: Text("Settings", style: Styles.paragraph),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
