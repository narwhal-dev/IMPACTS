import 'package:flutter/material.dart';
//import '../screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'config/palette.dart';
import 'screens/landing_screen.dart';
//import 'screens/verification_screen.dart';

//void main() => runApp(const MyApp());
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    builder: (context, _){
      final themeProvider = Provider.of<ThemeProvider>(context);

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        themeMode: themeProvider.themeMode,
        theme: Palette.lightTheme.copyWith(
          textTheme: Palette.lightTheme.textTheme.apply(
            fontFamily: 'SF-Pro',
          ),
        ),
        darkTheme: Palette.darkTheme.copyWith(
          textTheme: Palette.darkTheme.textTheme.apply(
            fontFamily: 'SF-Pro',
          ),
        ),
        //home: BottomNavScreen(),
        home: LandingPage(),
//        home: VerificationPage('+639770972774'),
      );
   },
  );
}