import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() { //this is trigered when the reference of the State change, hence we can tap into the context, unlike initState which is called before we have a context, hence we can't use it in this case
    super.didChangeDependencies();
    final routeArguments = ModalRoute.of(context).settings.arguments as Map<
        String,
        String>; //create ModalRoute to match the type of arguments created in the CategoryItem Navigator
    categoryTitle = routeArguments['title'];
    final categoryId = routeArguments['id'];
    displayedMeals = DUMMY_MEALS.where(
        //categoryMeals will contain only the meals which contains the categoryId in the categories (see dummy data, it will make sense)
        (element) {
      return element.categories.contains(categoryId);
    }).toList();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            title: displayedMeals[index].title,
            id: displayedMeals[index].id,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
