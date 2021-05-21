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