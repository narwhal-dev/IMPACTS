import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:impacts/config/styles.dart';
import 'package:impacts/widget/background.dart';

class QRCode extends StatefulWidget {
  @override
  _QRCodeState createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        background(context),
        Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: AppBar(
              elevation: 0.0,
              brightness: Brightness.light,
              backgroundColor: Theme.of(context).canvasColor,
              automaticallyImplyLeading: false,
              centerTitle: false,
            ),
          ),
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            physics: ClampingScrollPhysics(),
            slivers: [
              header(context),
              content(context),
              bodyQR(context),
            ],
          ),
        ),
      ],
    );
  }

  SliverToBoxAdapter header(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0, bottom: 20.0),
        alignment: Alignment.topLeft,
        color: Theme.of(context).canvasColor,
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'IMPACTS',
                style: TextStyle(fontFamily: 'SF-Pro', color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(SFSymbols.arrow_left_circle,
                      color: Colors.black, size: 30.0),
                ),
              ),
            ],
          ),
          top: true, bottom: false, left: false, right: false,
        ),
      ),
    );
  }

  SliverToBoxAdapter content(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.7,
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20.0,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 100.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/pic frame.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('USERNAME', style: Styles.title5),
                        SizedBox(height: 3.0),
                        Text('• Good Condition', style: Styles.condition),
                        SizedBox(height: 8.0),
                        Text('Update Health Status',
                            style: TextStyle(
                                fontFamily: 'SF-Pro',
                                color: Color(0xFF333333),
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        SizedBox(height: 4.0),
                        Container(
                          height: 20.0,
                          width: 220.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF717171)),
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.1),
                          ),
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text('UPDATE', style: Styles.caption),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 1.0, color: Color(0xFF717171), height: 40.0),
            SizedBox(height: 25.0),
            Text(
              'Your QR Code',
              style: TextStyle(
                  fontFamily: 'SF-Pro',
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30.0),
            Center(
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),

              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter bodyQR(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.25,
        padding: const EdgeInsets.only(left: 40.0, top: 20.0, right: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                'Help us fight COVID-19',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'SF-Pro',
                    color: Theme.of(context).primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
                'You can help us stop the spread of COVID-19 by staying safe at home, and help us by reporting your health condition for us to know that you are in good condition.',
                style: TextStyle(
                    fontFamily: 'SF-Pro',
                    color: Theme.of(context).buttonColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}
