
import 'package:flutter/material.dart';

import './Screens/category_meals_screen.dart';
import './Screens/categories_screen.dart';
import './Screens/meal_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Meals',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.pink,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: CategoriesScreen(),
      //instead of using home: ScreenWidget we can delete home and use a route as: '/': (ctx) =>ScreenWidget()
      routes: { //create a route for each screen (an identifier)
       // '/category-meals': (ctx) => CategoryMealsScreen() //we have created identifier for CategoryMealsScreen - one of the options
       CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(), //is the same as the previous line
       MealDetailScreen.routeName: (ctx) => MealDetailScreen()
      },
    );
  }
}
