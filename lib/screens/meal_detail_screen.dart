import 'package:flutter/material.dart';
import 'package:meals_app/src/dummy_data.dart';

class MealDetail extends StatelessWidget {
  final Function _toggleFavourite;
  final Function _isMealFavourite;

  const MealDetail(this._toggleFavourite, this._isMealFavourite);

  @override
  Widget build(BuildContext context) {
    final _mealId = ModalRoute.of(context).settings.arguments as String;
    final _chosenMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == _mealId);
    final _mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('${_chosenMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _mediaQuery.size.height * 0.4,
              width: double.infinity,
              child: Image.network(
                _chosenMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildHeading('Ingredients', context),
            _buildContainer(
              _mediaQuery.size.height,
              ListView.builder(
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      '${_chosenMeal.ingredients[index]}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  );
                },
                itemCount: _chosenMeal.ingredients.length,
              ),
            ),
            _buildHeading('Steps', context),
            _buildContainer(
              _mediaQuery.size.height,
              ListView.builder(
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 15,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(
                          _chosenMeal.steps[index],
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Divider(
                        thickness: 1.2,
                      ),
                    ],
                  );
                },
                itemCount: _chosenMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>_toggleFavourite(_mealId),
        child: Icon(_isMealFavourite(_mealId)?Icons.star:Icons.star_border),
      ),
    );
  }

  Widget _buildHeading(String _heading, BuildContext ctx) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        _heading,
        style: Theme.of(ctx).textTheme.headline6,
      ),
    );
  }

  Widget _buildContainer(double height, Widget child) {
    return Container(
      height: height * 0.25,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
