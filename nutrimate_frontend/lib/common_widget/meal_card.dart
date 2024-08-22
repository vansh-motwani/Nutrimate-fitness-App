import 'package:flutter/material.dart';
import 'package:nutrimate/Provider/meal_dishes.dart';
import 'package:nutrimate/Provider/number_of_mealsProvider.dart';
import 'package:nutrimate/common_widget/nutrient_display.dart';
import 'package:nutrimate/view/meals/meal_time_details.dart';
import 'package:provider/provider.dart';

class MealCard extends StatelessWidget {
  const MealCard(
      {super.key,
      required this.img,
      required this.Meal,
      required this.Calories,
      required this.Carbs,
      required this.Protein,
      required this.Fat,});
  final String img;
  final String Meal;
  final int Calories;
  final int Carbs;
  final int Protein;
  final int Fat;
  
  @override
  Widget build(BuildContext context) {
    final Meal_low=Meal.toLowerCase();
    final Meal_lower='${Meal_low}_lower';
    final Meal_upper='${Meal_low}_upper';
    final value=Provider.of<MealCountProvider>(context);
    final Map<dynamic,dynamic> chosen={
      'meal_type':Meal_low,
      'food_calorie_min':100,
      'food_calorie_max':1000,
    };
    return SizedBox(
      height: 120,
      child: Card(
        elevation: 8.0,
        margin: EdgeInsets.all(10), // Controls the shadow size
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 148, 194, 231),
                      ),
                      child: Center(
                        child: Image.asset(img,
                        width: 30,
                        height: 30,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Text(Meal),
                  ],
                ),
                const Spacer(),
                Consumer<DishesDetails>(
                  builder: (ctx,temp,child)=> IconButton(
                      onPressed: () {
                        temp.onSubmit(chosen);
                        if(temp.current_dishes.isNotEmpty){
                        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const MealTimeList()));
                        }
                      },
                      icon: const Icon(
                        Icons.navigate_next,
                      )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Nutrients(title: 'Calorie', subtitle: '$Calories\Kcal'),
                Nutrients(title: 'Carbs', subtitle: '$Carbs\gm'),
                Nutrients(title: 'Protein', subtitle: '$Protein\gm'),
                Nutrients(title: 'Fat', subtitle: '$Fat\gm'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
