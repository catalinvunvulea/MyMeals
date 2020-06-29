import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {

final List<Meal> favouriteMeals;

FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
       return Center(child: Text("You don't have a favourite meal yeat - add one"),);
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: favouriteMeals[index].title,
            id: favouriteMeals[index].id,
            imageUrl: favouriteMeals[index].imageUrl,
            duration: favouriteMeals[index].duration,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordability,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
   
  }
}