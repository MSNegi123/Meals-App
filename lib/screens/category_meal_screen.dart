import 'package:flutter/material.dart';

import '../models/mealModel.dart';
import './meal_item.dart';
import '../models/categoryModel.dart';

class CategoryMeals extends StatefulWidget {
  final List<MealModel> _availableMeals;

  const CategoryMeals(this._availableMeals);

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  CategoryModel _categoryModel;
  List<MealModel> _categoryMeals;

  @override
  void initState() {
    print("creating new state");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _categoryModel = ModalRoute.of(context).settings.arguments as CategoryModel;
    _categoryMeals = widget._availableMeals
        .where((meal) => meal.categories.contains(_categoryModel.id))
        .toList();
    super.didChangeDependencies();
  }

  @override
  void setState(fn) {
    print('Calling Set state');
    super.setState(fn);
  }

  @override
  void didUpdateWidget(covariant CategoryMeals oldWidget) {
    print('Updating widget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryModel.title),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return MealItem(
            id: _categoryMeals[index].id,
            title: _categoryMeals[index].title,
            imgUrl: _categoryMeals[index].imageUrl,
            duration: _categoryMeals[index].duration,
            complexity: _categoryMeals[index].complexity,
            affordability: _categoryMeals[index].affordability,
          );
        },
        itemCount: _categoryMeals.length,
      ),
    );
  }

  @override
  void deactivate() {
    print('Calling Deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('Calling dispose');
    super.dispose();
  }

  void _removeMealItem(String _mealId) {
    setState(() {
      _categoryMeals.removeWhere((mealItem) => mealItem.id == _mealId);
    });
  }
}
