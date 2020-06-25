import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {

  static const routeName = "/category-meals"; //we create a identifier for this screen in a static const which can be accessed withouth having to instntiate it
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>; //create ModalRout to match the type of arguments created in the CategoryItem Navigator
    final categoryTitle = routeArguments['title'];
    final categoryId = routeArguments['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text(categoryTitle),
      ),
    );
  }
}
