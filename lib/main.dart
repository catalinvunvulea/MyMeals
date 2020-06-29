import 'package:MyMeals/Screens/filters_screen.dart';
import 'package:MyMeals/dummy_data.dart';
import 'package:flutter/material.dart';

import './Screens/category_meals_screen.dart';
import './Screens/categories_screen.dart';
import './Screens/meal_detail_screen.dart';
import './Screens/tabs_to_bottom_screen.dart';
import './Screens/filters_screen.dart';
import './dummy_data.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          //if gluten is false and it is not gluten free, we don't wan to include it in the list
          return false; //if we return false, this won't show in the Map(Dictionary)
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          print(_filters['vegan']);
          return false;
        }
        if (_filters['vegeterian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourites(String mealId) {
    final existingIndex = _favouriteMeals.indexWhere((element) =>
        element.id ==
        mealId); //if false, index = -1, if true, it will show the respetive index
    if (existingIndex >= 0) {
      //we check if the meal already exist in the favourites
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals.add(
          DUMMY_MEALS.firstWhere(
            //we are not using _availableMeals as we don't want to apply filters to favourite meals
            (element) => element.id == mealId,
          ),
        );
      });
    }
  }

  bool _isMealFavourite(String id) {
    return _favouriteMeals.any((element) => element.id == id); //returns true if condition is meat
  }

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
      home: TabsToBottomScreen(_favouriteMeals),
      //instead of using home: ScreenWidget we can delete home and use a route as: '/': (ctx) =>ScreenWidget()
      routes: {
        //create a route for each screen (an identifier)
        // '/category-meals': (ctx) => CategoryMealsScreen() //we have created identifier for CategoryMealsScreen - one of the options
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(
            _availableMeals), //is the same as the previous line
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggleFavourites, _isMealFavourite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters)
      },
      // onGenerateRoute: (settings) {
      //   //can be used when we biult highly dinamic apps where we have route names (identifiers) that are generated dinamically
      //   if (settings.name == '/meal-detail') {
      //     return MaterialPageRoute(
      //       builder: (ctx) => CategoriesScreen(),
      //     );
      //   }
      //   ;
      // },
      onUnknownRoute: (settings) {
        //unknown route is reached when flutter fails to biuld a screen with all other measures, before it shows an error, it's a good ideea to show a page as "we couldn't find that page"
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
