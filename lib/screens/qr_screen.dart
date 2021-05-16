import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:impacts/config/styles.dart';

class QRPage extends StatefulWidget {
  @override
  _QRPageState createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
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
                          'QR Code',
                          style: TextStyle(
                              fontFamily: 'SF-Pro',
                              color: Theme.of(context).primaryColor,
                              fontSize: 36,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(SFSymbols.bell,
                            color: Theme.of(context).primaryColor),
                      ],
                    ),
                    top: true,
                    bottom: false,
                    left: true,
                    right: true,
                    minimum: EdgeInsets.only(
                        left: 40.0, top: 55.0, right: 40.0, bottom: 80.0),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 15.0),
                  child: QRCodeWidget(context),
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40.0, 80.0, 40.0, 0.0),
                  child: HealthFormWidget(context),
                  height: MediaQuery.of(context).size.height * 0.4,
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

// ignore: non_constant_identifier_names
Widget QRCodeWidget(BuildContext context) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 0,
                blurRadius: 20.0,
                offset: Offset(-10, 10),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: -80.0,
        right: -10.0,
        child: Container(
          width: 286,
          height: 264,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/qr code.png'),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'GENERATE\nQR CODE',
              style: Styles.title1,
            ),
            SizedBox(height: 10.0),
            Text(
              'Click to generate QR Code',
              style: Styles.title6,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0, bottom: 15.0),
              child: Center(
                child: Container(
                  width: 250.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0xFF261A0E),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}


// ignore: non_constant_identifier_names
Widget HealthFormWidget(BuildContext context) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 0,
                blurRadius: 20.0,
                offset: Offset(-10, 10),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: -80.0,
        right: 20.0,
        child: Container(
          width: 194,
          height: 240,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/checklist.png'),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FILL OUT HEALTH\nDECLARATION FORM',
              style: Styles.title2,
            ),
            SizedBox(height: 10.0),
            Text(
              'Click to fill out\nthe necessary information',
              style: Styles.title6,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0, bottom: 15.0),
              child: Center(
                child: Container(
                  width: 250.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0xFF261A0E),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
