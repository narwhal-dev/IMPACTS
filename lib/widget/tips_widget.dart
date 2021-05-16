import 'package:flutter/material.dart';

Widget TipsWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Prevention Tips',
        style: TextStyle(
          fontFamily: 'SF-Pro', color: Theme.of(context).primaryColorLight, fontSize: 28, fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 8.0),
      Row(
        //crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Column(
              children: [
                Image.asset('assets/images/distancing group.png', height: 90.0, width: 90.0),
                SizedBox(height: 8.0),
                Text('Avoid close contact',
                  style: TextStyle(
                    fontFamily: 'SF-Pro', color: Theme.of(context).indicatorColor, fontSize: 13, fontWeight: FontWeight.bold,
                  ),
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
                  style: TextStyle(
                    fontFamily: 'SF-Pro', color: Theme.of(context).indicatorColor, fontSize: 13, fontWeight: FontWeight.bold,
                  ),
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
                  style: TextStyle(
                    fontFamily: 'SF-Pro', color: Theme.of(context).indicatorColor, fontSize: 13, fontWeight: FontWeight.bold,
                  ),
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
