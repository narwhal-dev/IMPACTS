import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../config/styles.dart';
import '../widget/background.dart';
import '../widget/profile_card_widget.dart';
import '../widget/tips_widget.dart';
import '../widget/updates_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        background(context),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              header(context),
              profileCard(context),
              tips(context),
              updates(context),
            ],
          ),
        ),
      ],
    );
  }

  SliverToBoxAdapter header(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.125,
        padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
        alignment: Alignment.topLeft,
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'IMPACTS',
                style: Styles.title1.merge(TextStyle(color: Theme.of(context).primaryColor)),
              ),
              GestureDetector(
                onTap: () {
                  print('Clicked!');
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(CupertinoIcons.bell, color: Theme.of(context).primaryColor, size: 30.0),
                ),
              ),
            ],
          ),
          top: true, bottom: false, left: false, right: false,
        ),
      ),
    );
  }

  SliverToBoxAdapter profileCard(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 10.0),
        child: profileCardWidget(context),
        height: MediaQuery.of(context).size.height * 0.21,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  SliverToBoxAdapter tips(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 10.0),
        child: tipsWidget(context),
        height: MediaQuery.of(context).size.height * 0.201,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  SliverToBoxAdapter updates(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 10.0),
        child: updatesWidget(context),
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
