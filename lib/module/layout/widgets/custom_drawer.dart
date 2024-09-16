
import 'package:flutter/material.dart';
import 'package:news/module/layout/home_screen.dart';
typedef OnChangeTab =void Function(EnumSideMenuItems);
class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    required this.mediaQueryHeight,
    required this.theme,
    required this.onChangeTab,
  });
  final double mediaQueryHeight;
  final ThemeData theme;
  OnChangeTab onChangeTab ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: mediaQueryHeight * 0.25,
          decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          child: Center(
            child: Text(
              "News APP!",
              style:
              TextStyle(color: theme.colorScheme.onPrimary, fontSize: 30),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            onChangeTab(EnumSideMenuItems.category);
          },
          overlayColor:const  WidgetStatePropertyAll(Colors.transparent),
          child: ListTile(
            leading:const  Icon(Icons.category ,size: 30,),
            iconColor:theme.colorScheme.inverseSurface,
            contentPadding:const  EdgeInsets.symmetric(vertical: 5 , horizontal: 30),
            title: Text("Category" ,style: TextStyle(color: theme.colorScheme.inverseSurface , fontSize: 25),),
          ),
        ),
        InkWell(
          onTap: () {
            onChangeTab(EnumSideMenuItems.settings);
          },
          overlayColor:const  WidgetStatePropertyAll(Colors.transparent),
          child: ListTile(
            leading:const  Icon(Icons.settings ,size: 30,),
            iconColor:theme.colorScheme.inverseSurface,
            contentPadding:const  EdgeInsets.symmetric(vertical:5, horizontal: 30),
            title: Text("Settings" ,style: TextStyle(color: theme.colorScheme.inverseSurface , fontSize: 25),),
          ),
        ),
      ],
    );
  }
}
