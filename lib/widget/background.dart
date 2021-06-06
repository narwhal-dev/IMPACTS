import 'package:flutter/material.dart';

Widget background(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
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
  );
}

Widget startBackground(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xFFFF7B67),
          Color(0xFFEB4D37),
        ],
      ),
    ),
  );
}

Widget appBarBackground(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    brightness: Brightness.dark,
  );
}