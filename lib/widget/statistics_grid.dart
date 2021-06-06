import 'package:flutter/material.dart';
import '../config/styles.dart';

// ignore: non_constant_identifier_names
Widget StatisticsGrid(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.275,
    child: Column(
      children: [
        Flexible(
          child: Row(
            children: [
              Expanded(
                child: StatisticsCard(context, 'Total Cases', '123, 456, 789'),
              ),
              StatisticsCard(context, 'Deaths', '123, 456'),
            ],
          ),
        ),
        Flexible(
          child: Row(
            children: [
              StatisticsCard(context, 'Recovered', '123, 456'),
              Expanded(
                child: StatisticsCard(context, 'Active Cases', '123, 456, 789'),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// ignore: non_constant_identifier_names
Widget StatisticsCard(BuildContext context, String title, String count) {
  return Container(
    width: 130.0,
    margin: const EdgeInsets.all(6.0),
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: Theme.of(context).canvasColor,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 2.0,
          blurRadius: 10.0,
          offset: Offset(-4,4),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Styles.title5.merge(TextStyle(color: Color(0xFF261A0E), fontWeight: FontWeight.w600))),
        Text(count, style: Styles.title3.merge(TextStyle(color: Color(0xFF261A0E), fontWeight: FontWeight.w800))),
      ],
    ),
  );
}
