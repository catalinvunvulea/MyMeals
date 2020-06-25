import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName =
      "/category-meals"; //we create a identifier for this screen in a static const which can be accessed withouth having to instntiate it
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArguments = ModalRoute.of(context).settings.arguments as Map<
        String,
        String>; //create ModalRoute to match the type of arguments created in the CategoryItem Navigator
    final categoryTitle = routeArguments['title'];
    final categoryId = routeArguments['id'];
    final categoryMeals = DUMMY_MEALS.where(
        //categoryMeals will contain only the meals which contains the categoryId in the categories (see dummy data, it will make sense)
        (element) {
      return element.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: categoryMeals[index].title,
            id: categoryMeals[index].id,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
