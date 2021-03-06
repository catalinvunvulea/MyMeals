import 'package:flutter/material.dart';

import '../Screens/meal_detail_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String id;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;


  MealItem({
    @required this.title,
    @required this.id,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  //we add a getter to "translate" the enum value
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break; //in this case we don't need o add break as we return something, but to avoid the code entering in other case (like default), it is recommanded ot use breack after each statement.
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Difficult';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilitytext {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailScreen.routeName, arguments: id)
        .then((value) {//pushNamed return a future; the func is over only once the pushedScreen is closed; with then we can receive something from the pushedScreen (passed from that screen using pop(dataToSend))
      if (value != null) { //as the previos screen can be also dismissed from the backButton from Bar, we need to ensure it was from our custom button which will send back a value(mealId)
       // removeItem(value); //initially used only as a different example
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              //used to place items one on top of each other; size is defined by it's biggest child
              children: <Widget>[
                ClipRRect(
                  //will force his child to take a certain form (ex an image to have rounded corners)
                  borderRadius: BorderRadius.only(
                    //we only round the top corners
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  //available only in a stack
                  bottom: 10,
                  right: 10,
                  child: Container(
                    width: 250,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      softWrap:
                          true, //if the text is too long, it will be split in lines
                      overflow: TextOverflow
                          .fade, //text will fade if exceed the margins, if softWrap it's not enough
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text('${complexityText}'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.monetization_on),
                      SizedBox(width: 6),
                      Text('${affordabilitytext}'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
