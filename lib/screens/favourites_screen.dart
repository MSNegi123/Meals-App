import 'package:flutter/material.dart';

import '../models/mealModel.dart';
import 'meal_item.dart';

class Favourites extends StatelessWidget {
  final List<MealModel> _favouriteMeals;

  const Favourites(this._favouriteMeals);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: _favouriteMeals.isEmpty
          ? const Text("You don't have any favourite meal yet. Try adding some")
          : ListView.builder(
              itemBuilder: (_, index) {
                return MealItem(
                  id: _favouriteMeals[index].id,
                  title: _favouriteMeals[index].title,
                  imgUrl: _favouriteMeals[index].imageUrl,
                  duration: _favouriteMeals[index].duration,
                  complexity: _favouriteMeals[index].complexity,
                  affordability: _favouriteMeals[index].affordability,
                );
              },
              itemCount: _favouriteMeals.length,
            ),
    );
  }
}
