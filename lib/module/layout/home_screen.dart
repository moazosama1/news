import 'package:flutter/material.dart';
import 'package:news/module/layout/screen/category_screen.dart';
import 'package:news/module/layout/screen/category_screen/tabs/category_details_screen.dart';
import 'package:news/module/layout/screen/settings_screen.dart';
import 'package:news/module/layout/widgets/custom_drawer.dart';

import '../../core/widgets/bg.dart';
import '../../models/category_data.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    return CustomBgApp(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: theme.colorScheme.onPrimary, size: 35),
        title: Text(
          "News App",
          style: TextStyle(
              color: theme.colorScheme.onPrimaryContainer, fontSize: 25),
        ),
        leadingWidth: 80,
      ),
      drawer: Drawer(
        width: mediaQueryWidth * 0.65,
        child: CustomDrawer(
          mediaQueryHeight: mediaQueryHeight,
          theme: theme,
          onChangeTab: onSideMenuItems,
        ),
      ),
      body: selectedSideMenu == EnumSideMenuItems.settings
          ? const SettingsScreen()
          : selectedCategory == null
              ? CategoryScreen(
                  onCategoryClick: onCategoryTab,
                )
              : CategoryDetailsScreen(category: selectedCategory!),
    ));
  }

  EnumSideMenuItems selectedSideMenu = EnumSideMenuItems.category;
  void onSideMenuItems(EnumSideMenuItems newsSideMenu) {
    selectedSideMenu = newsSideMenu;
    selectedCategory = null;
    Navigator.of(context).pop();
    setState(() {});
  }

  CategoryData? selectedCategory;
  void onCategoryTab(CategoryData category) {
    selectedCategory = category;
    setState(() {});
  }
}

enum EnumSideMenuItems { category, settings }
