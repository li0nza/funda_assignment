import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funda_assignment/repositories/property_feed.dart';
import 'package:funda_assignment/views/home.dart';
import 'package:funda_assignment/views/property_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PropertyFeedRepo()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Color primaryColor = Color(0xFFf7a100);
  final Color accentColor = Color(0xFF0071b3);
  final Color errorColor = Color(0xFF53241b);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Funda Assignment',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: primaryColor,
        accentColor: accentColor,
        errorColor: errorColor,
        textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              shadows: [
                Shadow(offset: Offset(-1, -1), color: Colors.black),
                Shadow(offset: Offset(1, -1), color: Colors.black),
                Shadow(offset: Offset(1, 1), color: Colors.black),
                Shadow(offset: Offset(-1, 1), color: Colors.black),
              ],
            ),
            headline2: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              shadows: [
                Shadow(offset: Offset(-1, -1), color: Colors.black),
                Shadow(offset: Offset(1, -1), color: Colors.black),
                Shadow(offset: Offset(1, 1), color: Colors.black),
                Shadow(offset: Offset(-1, 1), color: Colors.black),
              ],
            ),
            ),
      ),
      home: Home(),
    );
  }
}
