import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:flutter/material.dart';
import 'package:impacts/config/palette.dart';
import 'package:impacts/config/styles.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(55, 46, 46, 1),
                  Palette.defaultBackground,
                ],
                stops: [0.0, 0.55],
              ),
            ),
          ),
          Container(
            child: SafeArea(
              child: Text('IMPACTS', style: Styles.title1),
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
