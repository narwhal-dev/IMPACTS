import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:impacts/config/styles.dart';
import 'package:impacts/widget/background.dart';

class Checklist extends StatefulWidget {
  @override
  _ChecklistState createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        brightness: Theme.of(context).appBarTheme.brightness,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          icon: Icon(SFSymbols.arrow_left_circle,
              color: Colors.black, size: 30.0),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          background(context),
          Container(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      'Health Checklist',
                      style: TextStyle(
                          fontFamily: 'SF-Pro',
                          color: Theme.of(context).primaryColor,
                          fontSize: 36,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                    child: Text(
                      'Are you experiencing:',
                      style: TextStyle(
                        fontFamily: 'SF-Pro',
                        color: Theme.of(context).primaryColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
