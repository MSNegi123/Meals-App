import 'package:flutter/material.dart';
import './category_item.dart';
import '../src/dummy_data.dart';

class Categories extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 3 / 2,
      ),
      children:
          DUMMY_CATEGORIES.map((category) => CategoryItem(category)).toList(),
    );
  }
}
