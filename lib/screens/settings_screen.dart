import 'package:flutter/material.dart';
import 'package:impacts/widget/background.dart';
import 'package:impacts/widget/change_theme_button.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
              themechanger(context),
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
        padding: const EdgeInsets.only(left: 40.0, right: 40.0),
        alignment: Alignment.topLeft,
        child: SafeArea(
          child: Text(
            'Settings',
            style: TextStyle(
                fontFamily: 'SF-Pro',
                color: Theme.of(context).primaryColor,
                fontSize: 36,
                fontWeight: FontWeight.bold),
          ),
          top: true,
          bottom: false,
          left: false,
          right: false,
        ),
      ),
    );
  }

  SliverToBoxAdapter themechanger(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
          alignment: Alignment.topLeft,
          child: ChangeThemeButtonWidget(),
        ),
      ),
    );
  }
}
