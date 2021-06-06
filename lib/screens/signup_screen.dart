import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../config/styles.dart';
import '../widget/background.dart';
import 'landing_screen.dart';
import 'login_screen.dart';
import 'verification_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _passwordVisible1 = false, _passwordVisible2 = false;
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //_SignUpPageState({Key? key, required this._phoneNumber}) : super(key: key);

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
        onTap: () {GestureDetector(
            onTap: () {
              WidgetsBinding.instance!.addPostFrameCallback((_) => _pass.clear());
              WidgetsBinding.instance!.addPostFrameCallback((_) => _confirmPass.clear());
              WidgetsBinding.instance!.addPostFrameCallback((_) => _phoneNumber.clear());
              _formKey.currentState?.reset();
              if (!FocusScope.of(context).hasPrimaryFocus) {
                FocusScope.of(context).unfocus();
              }
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => LandingPage(),
              ));
            },
            child: Container(
                margin: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 80.0, top: 10.0),
                child: Icon(CupertinoIcons.arrow_left_circle,
                    color: Colors.black, size: 30.0),

                if (!FocusScope.of(context).hasPrimaryFocus) {
            FocusScope.of(context).unfocus();
          }
        },
        child: Stack(
          children: [
            startBackground(context),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ),
                  ),

                  Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 40.0),
                      height: MediaQuery.of(context).size.height * 0.64,
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

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Sign Up',
                              style: Styles.title1.merge(TextStyle(color: Colors.black))),
                            Text('Create an account, it\'s free.',
                              style: Styles.title5.merge(TextStyle(fontWeight: FontWeight.w500))),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 30.0),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text('Phone Number',
                                      style: Styles.subheading.merge(TextStyle(color: Color(0xFFD5D1C9)))),
                                    Container(
                                      padding: const EdgeInsets.all(10.0),
                                      width: MediaQuery.of(context).size.width,
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
                                        // focusNode: _node,
                                        controller: _phoneNumber,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                          isDense: true,
                                          icon: Icon(Icons.smartphone, color: Colors.black, size: 25.0),
                                          hintText: '+63',
                                          hintStyle: Styles.label.merge(TextStyle(color: Color(0xFFD5D1C9), fontWeight: FontWeight.w500)),
                                        ),
                                        onTap: () {
                                          if (_phoneNumber.text.trim().isEmpty)
                                            _phoneNumber..text = '+63';
                                        },
                                        validator: (val) {
                                          val = val!.trim();
                                          if (val.isEmpty || val.length == 3)
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
                                      width: MediaQuery.of(context).size.width,
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
                                              obscureText: !_passwordVisible1,
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
                                                else if (val.length < 6)
                                                  return 'Password must be at least 6 characters long';
                                                return null;
                                              },
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              // Based on passwordVisible state choose the icon
                                              _passwordVisible1
                                                  ? Icons.visibility_rounded
                                                  : Icons.visibility_off_rounded,
                                              color: Color(0xFF717171),
                                              size: 20.0,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _passwordVisible1 =
                                                    !_passwordVisible1;
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                    ),

                                    SizedBox(height: 15.0),

                                    Text('Confirm Password',
                                        style: Styles.subheading.merge(
                                            TextStyle(color: Color(0xFFD5D1C9)))),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 5.0),
                                      width: MediaQuery.of(context).size.width,
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
                                              controller: _confirmPass,
                                              obscureText: !_passwordVisible2,
                                              style: TextStyle(color: Colors.black),
                                              decoration: InputDecoration(
                                                isDense: true,
                                                icon: Icon(CupertinoIcons.lock_fill, color: Colors.black, size: 25.0),
                                                hintText: 'Re-enter your password',
                                                hintStyle: Styles.label.merge(TextStyle(color: Color(0xFFD5D1C9), fontWeight: FontWeight.w500)),
                                              ),
                                              validator: (val){
                                                if(val!.isEmpty)
                                                  return 'Please enter password';
                                                if(val != _pass.text)
                                                  return 'Passwords do not match';
                                                return null;
                                              }
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              // Based on passwordVisible state choose the icon
                                              _passwordVisible2
                                                  ? Icons.visibility_rounded
                                                  : Icons.visibility_off_rounded,
                                              color: Color(0xFF717171),
                                              size: 20.0,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _passwordVisible2 =
                                                    !_passwordVisible2;
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                    ),

                                    SizedBox(height: 30.0),
                                    Container(
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
                                      child: GestureDetector(
                                        onTap: () {
                                          if (!FocusScope.of(context).hasPrimaryFocus) {
                                            FocusScope.of(context).unfocus();
                                          }
                                          if (_formKey.currentState!.validate()) {
                                            _continue(_phoneNumber.text);
                                          }
                                          else
                                            print('Unsuccessful');
                                        },
                                        child: Center(
                                          child: Text('Create account', style: Styles.title5.merge(
                                              TextStyle(color: Colors.white, fontWeight: FontWeight.w600))),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                                      child: RichText(
                                        text: TextSpan(
                                            text: 'By clicking on Sign up, you agree to our\n',
                                            style: Styles.label.merge(TextStyle(fontFamily: 'SF-Pro', color: Colors.black, fontWeight: FontWeight.w500)),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: 'Terms of service and Privacy policy.',
                                                  style: Styles.label.merge(TextStyle(color: Colors.black)),
                                                  recognizer: TapGestureRecognizer()
                                                    ..onTap = () {
                                                    print('Clicked!');
                                                    })
                                            ]),
                                      ),
                                    ),
                                    Divider(
                                        color: Color(0xFFD5D1C9),
                                        thickness: 2.0,
                                        height: 20.0),
                                    Center(
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'Already have an account?',
                                          style: Styles.subheading.merge(TextStyle(fontFamily: 'SF-Pro',)),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: ' Login',
                                              style: Styles.subheading.merge(TextStyle(fontWeight: FontWeight.bold)),
                                              recognizer: TapGestureRecognizer()..onTap = () {
                                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                                              }
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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

  Future<void> _continue(String phone) async{
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: const Text('Please confirm', style: TextStyle(color: Colors.black))),
          content: SingleChildScrollView(
            child: Center(child: Text('Are you sure you want to continue?', style: TextStyle(color: Colors.black))),
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
                      'Cancel',
                      style: TextStyle(color: Colors.black, fontSize: 22, fontFamily: 'SF-Pro'),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Expanded(
                  child: TextButton(
                    child: const Text('Confirm', style: TextStyle(color: Color(0xFFE30000), fontSize: 22, fontFamily: 'SF-Pro')),
                    onPressed: () {
                      WidgetsBinding.instance!.addPostFrameCallback((_) => _pass.clear());
                      WidgetsBinding.instance!.addPostFrameCallback((_) => _confirmPass.clear());
                      WidgetsBinding.instance!.addPostFrameCallback((_) => _phoneNumber.clear());
                      _formKey.currentState?.reset();
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => VerificationPage(phone),
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
}
