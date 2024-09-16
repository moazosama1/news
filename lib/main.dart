import 'package:flutter/material.dart';
import 'package:news/core/theme.dart';
import 'package:news/module/layout/home_screen.dart';

void main() {
  runApp(MyApplication());
}
class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.themeLight,
      home: HomeScreen(),
    );
  }
}