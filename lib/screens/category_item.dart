import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/categoryModel.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel _categoryModel;

  const CategoryItem(this._categoryModel);

  void _selectedMealCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(Routes.categoryMealRoute, arguments: _categoryModel);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectedMealCategory(context),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              _categoryModel.color.withOpacity(0.7),
              _categoryModel.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          _categoryModel.title,
          style: Theme.of(context).textTheme.headline6,textAlign:TextAlign.center,
        ),
      ),
    );
  }
}
