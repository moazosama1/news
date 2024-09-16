import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../api/models/source.dart';

class CustomTabItems extends StatelessWidget {
  Source source;
  bool isSelected;
  CustomTabItems({super.key, required this.source, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected
              ? theme.colorScheme.primaryContainer
              : Colors.transparent,
          border: Border.all(
              color: !isSelected
                  ? theme.colorScheme.primaryContainer
                  : Colors.transparent,
              width: 3)),
      child: Text(
        source.name ?? "",
        style: TextStyle(
            color: isSelected
                ? theme.colorScheme.onPrimaryContainer
                : theme.colorScheme.primaryContainer,
            fontSize: 20,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
