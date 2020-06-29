import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = './meal-detail-screen';
  final Function toggleFavourites;
  final Function isFavourite;

  MealDetailScreen(this.toggleFavourites, this.isFavourite);

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(
      //on this ocasion, as the MediaQuery triggers the build method, to avoid building the complete screen, it would be recommended to store this in a sepparate widget (in the same file as it is used only here)
      BuildContext context,
      double height,
      double width,
      Widget widget) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.yellowAccent[50],
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        height: MediaQuery.of(context).size.height * height,
        width: MediaQuery.of(context).size.width * width,
        child: widget);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final mealId = ModalRoute.of(context).settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((element) =>
        element.id ==
        mealId); //if will go through the Dummy meals and it will pick the data when the func is true (element.id == mealId)
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: mediaQuery.height * 0.3,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(
              context,
              0.22,
              0.8,
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                    child: Text(
                      '${selectedMeal.ingredients[index]}',
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
                context,
                0.22,
                0.8,
                ListView.builder(
                    itemBuilder: (ctx, index) => Column(
                          children: <Widget>[
                            ListTile(
                              leading: CircleAvatar(
                                child: Text('# ${index + 1}'),
                              ),
                              title: Text('${selectedMeal.steps[index]}'),
                            ),
                            Divider(), //add a single line
                          ],
                        ),
                    itemCount: selectedMeal.steps.length))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavourite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavourites(mealId),
      ),
    );
  }
}
