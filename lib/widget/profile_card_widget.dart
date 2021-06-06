import 'dart:ui';
import 'package:flutter/material.dart';
import '../config/styles.dart';
import 'buttons_widget.dart';

Widget profileCardWidget(BuildContext context){
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2.0,
              blurRadius: 10.0,
              offset: Offset(-4,4),
            ),
          ],
        ),
      ),
      Positioned(
        bottom: -20.0,
        right: -10.0,
        child: Container(
          width: 175,
          height: 125,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/blob.png'),
            ),
          ),
        ),
      ),
      Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/pic frame.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.0),
                      Text('USERNAME', style: Styles.title5),
                      SizedBox(height: 3.0),
                      Text('• Good Condition', style: Styles.condition),
                    ],
                  )
                ]
              ),
            ),
            Text(
              'Update Health Status',
              style: Styles.caption.merge(TextStyle(color: Color(0xFF717171))),
            ),
            SizedBox(height: 4.0),
            updateButton(context),
          ],
        )
      ),
    ],
  );
}