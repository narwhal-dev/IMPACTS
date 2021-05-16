import 'package:flutter/material.dart';
import 'package:impacts/widget/change_theme_button.dart';

class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).accentColor,
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
                      child: Text(
                          'Settings',
                          style: TextStyle(
                            fontFamily: 'SF-Pro',
                            color: Theme.of(context).primaryColor,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            //Styles.title1
                          ),
                      ),
                      top: true, bottom: false, left: true, right: true,
                      minimum: EdgeInsets.only(left: 40.0, top: 55.0, right: 40.0, bottom: 10.0),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
                    alignment: Alignment.topLeft,
                    child: ChangeThemeButtonWidget(),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
