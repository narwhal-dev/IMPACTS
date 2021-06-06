import 'package:flutter/cupertino.dart';
import 'package:impacts/screens/signup_screen.dart';
import 'dart:async';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../config/styles.dart';
import 'screens.dart';

class VerificationPage extends StatefulWidget {
  final String phoneNumber;
  VerificationPage(this.phoneNumber);
  //VerificationPage (String val, { Key? key, required this.phoneNumber}): super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _verificationCode = TextEditingController();
  int _counter = 30;
  Timer? _timer;

  void _startTimer() {
    _counter = 30;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(_counter > 0){
          _counter--;
        }
        else{
          timer.cancel();
        }
      });
    });
  }

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.white),
            SafeArea(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 40.0),
                      height: MediaQuery.of(context).size.height * 0.9,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verify(context, widget.phoneNumber),
                          //Text(widget.phoneNumber)
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Transform.scale(
                      scale: 1.22,
                      child: Container(
                        //color: Colors.black45,
                        margin: const EdgeInsets.only(left: 10.0, top: 80.0),
                        child: Image.asset('assets/images/frame.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget verify(BuildContext context, String phoneNumber) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            WidgetsBinding.instance!.addPostFrameCallback((_) => _verificationCode.clear());
            _formKey.currentState?.reset();
            FocusScope.of(context).unfocus();
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => SignUpPage(),
            ));
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 80.0, top: 10.0),
            child: Icon(CupertinoIcons.arrow_left_circle,
                color: Colors.black, size: 30.0),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10.0),
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color(0xFFFFEEED),
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        Text('Verify', style: Styles.title1.merge(TextStyle(color: Colors.black))),
        Center(
          child: Text( 'We sent your code to +63 ${phoneNumber.substring(3, 5)}* *** *${phoneNumber.substring(10, 13)}.',
              style: Styles.title5.merge(TextStyle(fontWeight: FontWeight.w500))),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("This code will expire in ", style: Styles.title5.merge(TextStyle(fontWeight: FontWeight.w500))),
            Text('00:${_counter.toString().padLeft(2, '0')}', style: Styles.title5.merge(TextStyle(color: Color(0xFFEB4D37)))),
          ],
        ),
        SizedBox(height:20.0),
        Form(
          key: _formKey,
          child: PinCodeTextField(
            appContext: context,
            length: 6,
            obscureText: false,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(15),
              fieldHeight: 45,
              fieldWidth: 45,
              activeColor: Color(0xFFD5D1C9),
              activeFillColor: Colors.white,
              selectedColor: Color(0xFFEB4D37),
              selectedFillColor: Colors.white,
              inactiveColor: Color(0xFFD5D1C9),
              inactiveFillColor: Colors.white,
            ),
            backgroundColor: Colors.white,
            cursorColor: Colors.black,
            enableActiveFill: true,
            errorAnimationController: errorController,
            controller: _verificationCode,
            boxShadows: [
              BoxShadow(
                offset: Offset(0, 5),
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
              )
            ],
              onCompleted: (v) {
                FocusScope.of(context).unfocus();
                print("Completed");
              },
            onChanged: (value) {
              setState(() {
                currentText = value;
              });
            }
          ),
        ),

        Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Didn\'t receive the code?\n',
              style: Styles.subheading.merge(TextStyle(fontFamily: 'SF-Pro', fontSize: 13)),
              children: <TextSpan>[
                TextSpan(
                  text: 'Resend OTP ',
                  style: Styles.subheading.merge(TextStyle(color:(_counter > 0)? Color(0xFF717171) : Color(0xFFEB4D37), fontWeight: FontWeight.bold)),
                  recognizer: TapGestureRecognizer()..onTap = () => (_counter > 0 && _counter < 30)? null: _startTimer(),
                ),
              ],
            ),
          ),
        ),

      //button
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Container(
            height: 52.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 20.0,
                  offset: Offset(0, 10),
                ),
              ],
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFFFF7B67),
                  Color(0xFFEB4D37),
                ],
              ),
            ),
            child: TextButton(
              onPressed: () {
                //_formKey.currentState!.validate();
                _formKey.currentState!.validate();
                // conditions for validating
                if (currentText.length != 6 || currentText != "111111") {
                  errorController!.add(ErrorAnimationType.shake); // Triggering error shake animation
                  setState(() {
                    hasError = true;
                  });
                } else {
                  setState(() {
                    hasError = false;
                    WidgetsBinding.instance!.addPostFrameCallback((_) => _verificationCode.clear());
                    _formKey.currentState?.reset();
                    FocusScope.of(context).unfocus();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => BottomNavScreen()));
                  });
                }
              },
              child: Text('Confirm', style: Styles.title5.merge(TextStyle(color: Colors.white, fontWeight: FontWeight.w600))),
            ),
          ),
        ),
      ],
    );
  }
}