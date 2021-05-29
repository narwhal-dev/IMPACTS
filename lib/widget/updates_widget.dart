import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:impacts/config/styles.dart';
import 'package:impacts/widget/statistics_grid.dart';

// ignore: non_constant_identifier_names
Widget UpdatesWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Covid-19 Updates',
        style: TextStyle(
          fontFamily: 'SF-Pro', color: Theme.of(context).primaryColorLight, fontSize: 28, fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 15.0),
      DefaultTabController(
          length: 2,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 50.0),
            height: 36.0,
            decoration: BoxDecoration(
              color:  Theme.of(context).buttonColor,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: TabBar(
              indicator: BubbleTabIndicator(
                  tabBarIndicatorSize: TabBarIndicatorSize.tab,
                  indicatorHeight: 28.0,
                  indicatorColor: Colors.white,
              ),
              labelStyle: Styles.subheading,
              labelColor: Color(0xFF261A0E),
              unselectedLabelColor:  Theme.of(context).focusColor,
              tabs: [
                Text('Philippines'),
                Text('Global'),
              ],
              onTap: (index) {},
            ),
          ),
      ),
      StatisticsTab(context),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: StatisticsGrid(context),
      ),
    ],
  );
}

// ignore: non_constant_identifier_names
Widget StatisticsTab(BuildContext context){
  DateTime now = new DateTime.now();
  List months =
  ['Jan', 'Feb', 'Mar', 'Apr', 'May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
  String monthDate = months[now.month-1];
  String date = "$monthDate ${now.day.toString()}, ${now.year.toString()}";
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Column(
      children: [
        DefaultTabController(
          length: 3,
          child: TabBar(
            indicatorColor: Colors.transparent,
            labelStyle: Styles.subheading,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Theme.of(context).indicatorColor,
            tabs: [
              Text('Total'),
              Text('Today'),
              Text('Yesterday'),
            ],
            onTap: (index) {},
          ),
        ),
        Text(date, style: TextStyle(color: Theme.of(context).iconTheme.color, fontFamily: 'SF-Pro', fontSize: 13, fontWeight: FontWeight.w500)),
        SizedBox(height: 15.0),
      ],
    ),
  );
}