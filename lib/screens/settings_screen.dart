import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../config/styles.dart';
import '../widget/background.dart';
import '../config/change_theme_button.dart';
import 'landing_screen.dart';

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
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
            child: CustomScrollView(
              slivers: [
                header(context),
                profileWidget(context),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.0),
                      Text('ID: 987654321', style: Styles.label.merge(TextStyle(color: Theme.of(context).iconTheme.color))),
                      Divider(color: Color(0xFF717171), thickness: 2.0),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ),

                textWidget(context, 'Security'),
                security(context),
                textWidget(context, 'Notifications'),
                notifications(context),
                textWidget(context, 'Display'),
                themechanger(context),
                textWidget(context, 'Help & Support'),
                textBody(context),
                SliverToBoxAdapter(
                  child: TextButton(
                    onPressed: () {
                      _exitApp();
                    },
                    child: Text(
                      'Logout',
                      style: Styles.title5.merge(TextStyle(color: Theme.of(context).primaryColor)),
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: MediaQuery.of(context).size.height*0.1)),
              ],
            ),
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
        alignment: Alignment.topLeft,
        child: SafeArea(
          child: Text(
            'Settings',
            style: Styles.title1.merge(TextStyle(color: Theme.of(context).primaryColor)),
          ),
          top: true,
          bottom: false,
          left: false,
          right: false,
        ),
      ),
    );
  }

  SliverToBoxAdapter profileWidget(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: MediaQuery.of(context).size.height*0.175,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFFFF7B67),
              Color(0xFFEB4D37),
            ],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/images/pic frame.png'),
            SizedBox(width: 15.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25.0),
                Text('USERNAME', style: Styles.title5.merge(TextStyle(color: Colors.white))),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(0.0)
                  ),
                  onPressed: () {
                    print('Clicked!');
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => QRCode()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Edit Profile', style: Styles.subheading.merge(TextStyle(color: Colors.white, fontWeight: FontWeight.w600))),
                      SizedBox(width: 10.0),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(CupertinoIcons.square, color: Colors.white, size: 25.0),
                          Icon(CupertinoIcons.pencil, color: Colors.white, size: 20.0),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _exitApp() async{
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: const Text('Log out', style: TextStyle(color: Colors.black))),
          content: SingleChildScrollView(
            child: Center(child: Text('Are you sure you want to log out?', style: TextStyle(color: Colors.black))),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    child: const Text(
                        'No',
                        style: TextStyle(color: Colors.black, fontSize: 22, fontFamily: 'SF-Pro'),
                        //style: Styles.subheading.merge(TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Expanded(
                  child: TextButton(
                    child: const Text('Yes', style: TextStyle(color: Color(0xFFE30000), fontSize: 22, fontFamily: 'SF-Pro')),
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => LandingPage(),
                      ));
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  SliverToBoxAdapter textWidget(BuildContext context, String info) {
    return SliverToBoxAdapter(
      child: Text(
        '$info',
        style: Styles.title3.merge(TextStyle(color: Theme.of(context).primaryColor)),
      ),
    );
  }

  SliverToBoxAdapter security(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(25.0),
        ),
        margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            line('Update Password'),
            line('Recovery methods'),
            line('Fingerprint Authentication'),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter notifications(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(25.0),
        ),
        margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.all(15.0),
        child: line('Push Notifications'),
      ),
    );
  }

  SliverToBoxAdapter themechanger(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(25.0),
        ),
        margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dark Mode', style: Styles.title5.merge(TextStyle(color: Color(0xFF0F0F0F), fontWeight: FontWeight.w600))),
                ChangeThemeButtonWidget(),
              ],
            ),
            Divider(color: Color(0xFF717171), thickness: 2.0),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter textBody(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          width: MediaQuery.of(context).size.width,
            child: Text(
          'COVID-19 Data Repository by the Center for Systems\nScience and Engineering (CSSE) at Johns Hopkins University https://github.com/CSSEGISandData/COVID-19',
          style: Styles.caption.merge(TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w500)),
        )),
      ),
    );
  }

  Widget line(String lineText){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$lineText', style: Styles.title5.merge(TextStyle(color: Color(0xFF0F0F0F), fontWeight: FontWeight.w600))),
            IconButton(
              icon: Icon(
                CupertinoIcons.chevron_right,
                color: Color(0xFF0F0F0F),
              ),
              onPressed: () {},
            ),
          ],
        ),
        Divider(color: Color(0xFF717171), thickness: 2.0, endIndent: 10.0),
      ],
    );
  }
}
