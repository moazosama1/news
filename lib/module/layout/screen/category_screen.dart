import 'package:flutter/material.dart';
import 'package:news/module/layout/screen/widgets/custom_category.dart';

import '../../../models/category_data.dart';
typedef OnCategoryClick = void Function(CategoryData);
class CategoryScreen extends StatelessWidget {
  CategoryScreen({
    required this.onCategoryClick,
    super.key,
  });
  OnCategoryClick onCategoryClick ;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pick your category\nof interest",
            style: TextStyle(
                fontSize: 22,
                color: theme.colorScheme.onSecondaryContainer,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 155 / 175,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  overlayColor:const WidgetStatePropertyAll(Colors.transparent),
                  onTap:() {
                    onCategoryClick(CategoryData.category[index]);
                  },
                  child: CustomCategory(
                    category: CategoryData.category[index],
                    isTrue: index % 2 == 0,
                  ),
                );
              },
              itemCount: CategoryData.category.length,
            ),
          )
        ],
      ),
    );
  }
}
