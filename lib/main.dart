import 'package:flutter/material.dart';

import './src/dummy_data.dart';
import './screens/meal_detail_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meal_screen.dart';
import './constants/constants.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';
import './models/mealModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  var _availableMeals = DUMMY_MEALS;
  List<MealModel> _favouriteMeals = [];

  void _setMealsFilters(Map<String, bool> _newFilters) {
    setState(() {
      _filters = _newFilters;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree)
          return false;
        else if (_filters['lactose'] && !meal.isLactoseFree)
          return false;
        else if (_filters['vegan'] && !meal.isVegan)
          return false;
        else if (_filters['vegetarian'] && !meal.isVegetarian)
          return false;
        else
          return true;
      }).toList();
    });
  }

  void _toggleFavourite(String _mealId) {
    int _existingIndex =
        _favouriteMeals.indexWhere((meal) => meal.id == _mealId);
    if (_existingIndex < 0) {
      _favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == _mealId));
    } else {
      _favouriteMeals.removeAt(_existingIndex);
    }
    setState(() {});
  }

  bool _isMealFavourite(String _mealId) {
    return _favouriteMeals.any((meal) => meal.id == _mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
      ),
      // home: TabsScreen(),
      routes: {
        Routes.homeRoute: (_) => TabsScreen(_favouriteMeals),
        Routes.categoryMealRoute: (_) => CategoryMeals(_availableMeals),
        Routes.mealDetailRoute: (_) =>
            MealDetail(_toggleFavourite, _isMealFavourite),
        Routes.FiltersRoute: (_) => Filters(_filters, _setMealsFilters),
      },
      // onGenerateRoute: (settings){
      //   print("Route Name: ${settings.name}");
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => Categories(),
        );
      },
    );
  }
}
