import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/module/layout/screen/category_screen/news/news_widget.dart';

import '../../../../api/models/source.dart';
import 'tabs/custom_tabs.dart';

class CategoryTab extends StatefulWidget {
  List<Source>? sources;
  CategoryTab(this.sources);

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {
  int selectedItems = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources?.length ?? 0,
        child: Column(
          children: [
            TabBar(
                onTap: (value) {
                  selectedItems = value;
                  setState(() {});
                },
                tabAlignment: TabAlignment.start,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                isScrollable: true,
                padding: const EdgeInsets.symmetric(vertical: 20),
                labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                tabs: widget.sources
                        ?.map(
                          (e) => CustomTabItems(
                            source: e,
                            isSelected:
                                selectedItems == widget.sources?.indexOf(e)
                                    ? true
                                    : false,
                          ),
                        )
                        .toList() ??
                    []),
            Expanded(child: NewsWidget(widget.sources?[selectedItems]))
          ],
        ));
  }
}
