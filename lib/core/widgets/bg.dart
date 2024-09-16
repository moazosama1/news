import 'package:flutter/material.dart';

class CustomBgApp extends StatelessWidget {
  Widget child;
  CustomBgApp({required this.child});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          color:theme.colorScheme.onPrimaryContainer ,
          image:const DecorationImage(
              image: AssetImage("assets/bg/pattern.png"), fit: BoxFit.cover)),
      child: child
    );
  }
}
