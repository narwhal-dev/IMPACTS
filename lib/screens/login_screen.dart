import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'landing_screen.dart';
import 'screens.dart';
import 'signup_screen.dart';
import '../config/styles.dart';
import '../widget/background.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false;
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            startBackground(context),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      WidgetsBinding.instance!.addPostFrameCallback((_) => _pass.clear());
                      WidgetsBinding.instance!.addPostFrameCallback((_) => _phoneNumber.clear());
                      if (!FocusScope.of(context).hasPrimaryFocus) {
                        FocusScope.of(context).unfocus();
                      }
                      _formKey.currentState?.reset();
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => LandingPage(),
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 100.0, top: 10.0),
                      child: Icon(CupertinoIcons.arrow_left_circle,
                          color: Colors.black, size: 30.0),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 40.0),
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: -5,
                            blurRadius: 20.0,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),

                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Login',
                                style: Styles.title1
                                    .merge(TextStyle(color: Colors.black))),
                              Text('Sign in to your account.',
                                style: Styles.title5.merge(TextStyle(fontWeight: FontWeight.w500))),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 30.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text('Phone Number',
                                        style: Styles.subheading.merge(
                                            TextStyle(color: Color(0xFFD5D1C9)))),
                                    Container(
                                      padding: const EdgeInsets.all(10.0),
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.2),
                                            spreadRadius: -5,
                                            blurRadius: 20.0,
                                            offset: Offset(0, 10),
                                          ),
                                        ],
                                      ),
                                      child: TextFormField(
                                        controller: _phoneNumber,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                          isDense: true,
                                          icon: Icon(Icons.smartphone,
                                              color: Colors.black, size: 25.0),
                                          hintText: '+63',
                                          hintStyle: Styles.label.merge(TextStyle(
                                              color: Color(0xFFD5D1C9),
                                              fontWeight: FontWeight.w500)),
                                        ),
                                        onTap: () {
                                          if (_phoneNumber.text.trim().isEmpty)
                                            _phoneNumber..text = '+63';
                                        },
                                        validator: (val) {
                                          if (val!.isEmpty || val.length == 3)
                                            return 'Please enter mobile number';
                                          else if (val.substring(0,3) != '+63')
                                            return 'Please use +63 with your number';
                                          else if (val.length != 13)
                                            return 'Please enter valid mobile number';
                                          return null;
                                        },
                                      ),
                                    ),

                                    SizedBox(height: 15.0),

                                    Text('Password',
                                        style: Styles.subheading.merge(
                                            TextStyle(color: Color(0xFFD5D1C9)))),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 5.0),
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.2),
                                            spreadRadius: -5,
                                            blurRadius: 20.0,
                                            offset: Offset(0, 10),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            child: TextFormField(
                                              controller: _pass,
                                              obscureText: !_passwordVisible,
                                              style: TextStyle(color: Colors.black),
                                              decoration: InputDecoration(
                                                isDense: true,
                                                icon: Icon(CupertinoIcons.lock, color: Colors.black, size: 25.0),
                                                hintText: 'Password',
                                                hintStyle: Styles.label.merge(TextStyle(color: Color(0xFFD5D1C9), fontWeight: FontWeight.w500)),
                                              ),
                                              validator: (val) {
                                                if (val!.isEmpty)
                                                  return 'Please enter password';
                                                return null;
                                              },
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              // Based on passwordVisible state choose the icon
                                              _passwordVisible
                                                  ? Icons.visibility_rounded
                                                  : Icons.visibility_off_rounded,
                                              color: Color(0xFF717171),
                                              size: 20.0,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _passwordVisible =
                                                    !_passwordVisible;
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                    ),

                                    SizedBox(height: 30.0),
                                    loginButton(context, 'Login'),

                                    Container(
                                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'Don\'t have an account?',
                                          style: Styles.subheading.merge(TextStyle(fontFamily: 'SF-Pro')),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: ' Sign up',
                                              style: Styles.subheading.merge(TextStyle(fontWeight: FontWeight.bold)),
                                              recognizer: TapGestureRecognizer()..onTap = () {
                                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                                              }
                                            )
                                          ]
                                        ),
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Forgot password?',
                                        style: Styles.subheading.merge(TextStyle(fontFamily: 'SF-Pro',)),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: ' Reset Password',
                                            style: Styles.subheading.merge(TextStyle(fontWeight: FontWeight.bold)),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                print('Clicked!');
                                              })
                                        ]
                                      ),
                                    ),
                                  ],
                                )
                              ),
                            ]
                          ),
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
    );
  }

  Widget loginButton(BuildContext context, String buttonText) {
    return Container(
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
          if (_formKey.currentState!.validate()) {
            WidgetsBinding.instance!.addPostFrameCallback((_) => _pass.clear());
            WidgetsBinding.instance!.addPostFrameCallback((_) => _phoneNumber.clear());
            _formKey.currentState?.reset();
            FocusScope.of(context).unfocus();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => BottomNavScreen()));
          }
          else
            print('Unsuccessful');
        },
        child: Text('$buttonText', style: Styles.title5.merge(
            TextStyle(color: Colors.white, fontWeight: FontWeight.w600))),
      ),
    );
  }
}
