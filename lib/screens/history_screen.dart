import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).scaffoldBackgroundColor,
                Theme.of(context).primaryColorDark,
              ],
            ),
          ),
        ),
        Container(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: SafeArea(
                    child: Text(
                      'History',
                      style: TextStyle(
                        fontFamily: 'SF-Pro',
                        color: Theme.of(context).primaryColor,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        //Styles.title1
                      ),
                    ),
                    top: true, bottom: false, left: true, right: true,
                    minimum: EdgeInsets.only(left: 40.0, top: 55.0, right: 40.0, bottom: 10.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

