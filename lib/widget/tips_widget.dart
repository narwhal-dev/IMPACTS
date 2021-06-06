import 'package:flutter/material.dart';
import '../config/styles.dart';

Widget tipsWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Prevention Tips',
        style: Styles.title2.merge(TextStyle(color: Theme.of(context).primaryColor)),
      ),
      SizedBox(height: 8.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Column(
              children: [
                Image.asset('assets/images/distancing group.png', height: 90.0, width: 90.0),
                SizedBox(height: 8.0),
                Text('Avoid close contact',
                  style: Styles.label.merge(TextStyle(color: Theme.of(context).indicatorColor)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Image.asset('assets/images/washing final.png', height: 90.0, width: 90.0),
                SizedBox(height: 8.0),
                Text('Regularly clean your hands',
                  style: Styles.label.merge(TextStyle(color: Theme.of(context).indicatorColor)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Image.asset('assets/images/mask final.png', height: 90.0, width: 90.0),
                SizedBox(height: 8.0),
                Text('Wear a face\nmask',
                  style: Styles.label.merge(TextStyle(color: Theme.of(context).indicatorColor)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}
