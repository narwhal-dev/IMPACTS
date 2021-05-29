import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:impacts/widget/background.dart';
import 'package:impacts/widget/profile_card_widget.dart';
import 'package:impacts/widget/tips_widget.dart';
import 'package:impacts/widget/updates_widget.dart';

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
                style: TextStyle(fontFamily: 'SF-Pro', color: Theme.of(context).primaryColor, fontSize: 36, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  print('Clicked!');
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(SFSymbols.bell,
                      color: Theme.of(context).primaryColor, size: 30.0),
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
        child: ProfileCardWidget(context),
        height: MediaQuery.of(context).size.height * 0.21,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  SliverToBoxAdapter tips(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 10.0),
        child: TipsWidget(context),
        height: MediaQuery.of(context).size.height * 0.201,
        //height: 190.0,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  SliverToBoxAdapter updates(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 10.0),
        child: UpdatesWidget(context),
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
