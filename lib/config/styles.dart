import 'package:flutter/material.dart';
import 'package:impacts/config/palette.dart';

// implementation: style: Styles.productRowItemName,
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
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle title1 = TextStyle(
    fontFamily: 'SF-Pro',
    color: Color(0xFF261A0E),
    fontSize: 36,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle title2 = TextStyle(
    fontFamily: 'SF-Pro',
    color: Color(0xFF261A0E),
    fontSize: 28,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle title3 = TextStyle(
    fontFamily: 'SF-Pro',
    color: Color(0xFF261A0E),
    fontSize: 22,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle title4 = TextStyle(
    fontSize: 20,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle title5 = TextStyle(
    fontFamily: 'SF-Pro',
    color: Colors.black,
    fontSize: 17,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle title6 = TextStyle(
    fontFamily: 'SF-Pro',
    color: Color(0xFF717171),
    fontSize: 17,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle paragraph = TextStyle(
    fontFamily: 'SF-Pro',
    color: Color(0xFF261A0E),
    fontSize: 17,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle subheading = TextStyle(
    fontFamily: 'SF-Pro',
    fontSize: 15,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle field = TextStyle(
    fontSize: 13,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle label = TextStyle(
    fontSize: 13,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle condition = TextStyle(
    fontFamily: 'SF-Pro',
    color: Color(0xFFEB4D37),
    fontSize: 11,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: 'SF-Pro',
    color: Colors.black,
    fontSize: 10,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );
}