import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:impacts/config/styles.dart';
import 'package:impacts/widget/background.dart';
import 'qr_code.dart';
import 'checklist.dart';

class QRPage extends StatefulWidget {
  @override
  _QRPageState createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
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
              bodyQRWidgets(context),
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
                'QR Code',
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

  SliverToBoxAdapter bodyQRWidgets(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            QRCodeWidget(context),
            HealthFormWidget(context),
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget QRCodeWidget(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(top: 25.0, bottom: 15.0),
    height: MediaQuery.of(context).size.height * 0.38,
    width: MediaQuery.of(context).size.width,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(30.0),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QRCode()),
          );
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
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
        ),
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
Widget HealthFormWidget(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(top: 80.0, bottom: 0.0),
    height: MediaQuery.of(context).size.height * 0.42,
    width: MediaQuery.of(context).size.width,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(30.0),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Checklist()),
          );
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
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
        ),
      ),
    ),
  );
}
