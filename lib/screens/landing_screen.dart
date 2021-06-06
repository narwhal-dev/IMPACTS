import 'dart:ui';
import 'package:flutter/material.dart';
import '../config/styles.dart';
import '../widget/background.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      // appBar: PreferredSize(
      //     preferredSize: Size.fromHeight(0.0),
      //     child: appBarBackground(context)
      // ),
      body: Stack(
        children: [
          startBackground(context),
          SafeArea(
            bottom: false,
            child: Stack(
              children: [
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 20.0),
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: Image.asset('assets/images/subject final.png'),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 40.0),
                    height: MediaQuery.of(context).size.height * 0.9,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40.0),
                        Expanded(
                            child: Text('MABUHAY.', style: Styles.large_title)
                        ),
                        clearButton(context),
                        SizedBox(height: 10.0),
                        darkButton(context),
                        SizedBox(height: 30.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget clearButton(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 25.0),
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white.withOpacity(0.1),
          ),
          child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text(
              'Login',
              style: Styles.title5.merge(TextStyle(color: Colors.black, fontWeight: FontWeight.w500))),
          ),
        ),
      ),
    );
  }

  Widget darkButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.0),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.black,
      ),
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpPage()));
        },
        child: Text(
          'Sign Up',
          style: Styles.title5.merge(TextStyle(color: Colors.white, fontWeight: FontWeight.w500))
        ),
      ),
    );
  }
}
