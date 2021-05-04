import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:flutter/material.dart';
import 'package:impacts/config/palette.dart';
import 'package:impacts/config/styles.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Palette.defaultBackground,
            ),
          ),
          Container(
            child: SafeArea(
              child: Text('Settings', style: Styles.title1),
              top: true,
              bottom: false,
              left: true,
              right: true,
              minimum: EdgeInsets.only(left: 40.0, top: 55.0, right: 40.0),
            ),
          ),
        ],
      ),
    );
  }
}
