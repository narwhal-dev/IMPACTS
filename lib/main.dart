import 'package:flutter/material.dart';
import 'package:impacts/screens/screens.dart';
import 'package:provider/provider.dart';
import 'config/palette.dart';

void main() => runApp(const MyApp());

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
          theme: Palette.lightTheme,
          darkTheme: Palette.darkTheme,
          home: BottomNavScreen(),
        );
     },
  );
}