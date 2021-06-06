import 'dart:ui';
import 'package:flutter/material.dart';
import '../screens/qr_code.dart';
import '../config/styles.dart';
import '../screens/checklist.dart';

Widget updateButton(BuildContext context) {
  return ClipRect(
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
      child: Container(
        height: 20.0,
        width: 220.0,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF717171)),
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white.withOpacity(0.1),
        ),
        child: OutlinedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Checklist()));
          },
          child: Text('UPDATE', style: Styles.caption.merge(TextStyle(color: Colors.black))),
        ),
      ),
    ),
  );
}

Widget nextButton(BuildContext context) {
  return Container(
    height: 52.0,
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color: Theme.of(context).canvasColor,
    ),
    child: TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => QRCode()));
      },
      child: Text('Save', style: Styles.title5.merge(TextStyle(fontWeight: FontWeight.w600))),
    ),
  );
}

