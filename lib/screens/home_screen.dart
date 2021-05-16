import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
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
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).scaffoldBackgroundColor,
                Theme.of(context).primaryColorDark,
              ],
            ),
          ),
        ),
        Container(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'IMPACTS',
                          style: TextStyle(fontFamily: 'SF-Pro', color: Theme.of(context).primaryColor, fontSize: 36, fontWeight: FontWeight.bold),
                        ),
                        Icon(SFSymbols.bell, color: Theme.of(context).primaryColor),
                      ],
                    ),
                    top: true, bottom: false, left: true, right: true,
                    minimum: EdgeInsets.only(left: 40.0, top: 55.0, right: 40.0, bottom: 10.0),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 10.0),
                  child: ProfileCardWidget(context),
                  height: 170.0,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 10.0),
                  child: TipsWidget(context),
                  height: 190.0,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 10.0),
                  child: UpdatesWidget(context),
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
