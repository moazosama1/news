import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../models/category_data.dart';

class CustomCategory extends StatelessWidget {
  CategoryData category;
  bool isTrue;
  CustomCategory({
    required this.category,
    required this.isTrue,
  });
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      height: 180,
      width: 160,
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(25),
            bottomRight:
                isTrue ? const Radius.circular(0) : const Radius.circular(25),
            topRight: const Radius.circular(25),
            bottomLeft:
                isTrue ? const Radius.circular(25) : const Radius.circular(0),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage(category.nameImage), height: 120, width: 120),
          Text(
            category.name,
            style: TextStyle(
                color: theme.colorScheme.onPrimaryContainer,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
