import 'package:flutter/material.dart';
/*
w100 Thin, the least thick
w200 Extra-light
w300 Light
w400 Normal / regular / plain
w500 Medium
w600 Semi-bold
w700 Bold
w800 Extra-bold
w900 Black, the most thick
 */
abstract class Styles {

  static const TextStyle large_title = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle title1 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle title2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle title3 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle title4 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle title5 = TextStyle(
    color: Colors.black,
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subheading = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle label = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle condition = TextStyle(
    color: Color(0xFFEB4D37),
    fontSize: 11,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
  );

}