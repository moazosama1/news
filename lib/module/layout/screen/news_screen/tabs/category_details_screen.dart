import 'package:flutter/material.dart';
import 'package:news/api/manager/api_manager.dart';
import 'package:news/models/category_data.dart';

import '../category_items.dart';

class CategoryDetailsScreen extends StatelessWidget {
  CategoryData category;
  CategoryDetailsScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSourceByCategory(category.id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Has Error"),
          );
        }
        if (snapshot.connectionState == ConnectionState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        var source = snapshot.data?.sources;
        return CategoryTab(source);
      },
    );
  }
}
