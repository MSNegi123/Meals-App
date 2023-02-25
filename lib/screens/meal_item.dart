import 'package:flutter/material.dart';

import '../constants/constants.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {@required this.title,
      @required this.imgUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.id});

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    return InkWell(
      onTap: () => _selectedMealItem(context),
      child: Card(
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imgUrl,
                    height: _mediaQuery.size.height * 0.3,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10.0),
                    color: Colors.black45,
                    width: _mediaQuery.size.height * 0.3,
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMealInfoSection(Icons.schedule, duration),
                  _buildMealInfoSection(Icons.work, _complexityText),
                  _buildMealInfoSection(Icons.attach_money, _affordabilityText),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String get _complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get _affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  void _selectedMealItem(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(Routes.mealDetailRoute, arguments: id);
  }

  Widget _buildMealInfoSection(IconData _icon, Object _data) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(_icon),
        SizedBox(
          width: 6,
        ),
        Text(_data.toString())
      ],
    );
  }
}
