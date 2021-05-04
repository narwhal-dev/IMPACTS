import 'package:flutter/material.dart';


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
    fontSize: 36,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle title2 = TextStyle(
    fontSize: 28,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle title3 = TextStyle(
    fontSize: 20,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle title4 = TextStyle(
    fontSize: 20,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle title5 = TextStyle(
    fontSize: 17,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle title6 = TextStyle(
    fontSize: 17,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle paragraph = TextStyle(
    fontSize: 17,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle subheading = TextStyle(
    fontSize: 15,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    height: 1.5,
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

  static const TextStyle caption = TextStyle(
    fontSize: 10,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );
}