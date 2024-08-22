import 'package:flutter/material.dart';
import 'package:nutrimate/common/colo_extension.dart';
import 'package:nutrimate/common_widget/macroCard.dart';
import 'package:nutrimate/common_widget/meal_card.dart';
import 'package:nutrimate/data/calorie_dist.dart';

class MealDetails extends StatefulWidget {
  const MealDetails({super.key});

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  final int Calories = 2500;
  final int Carbs = 126;
  final int Fat = 70;
  final int Protein = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset("assets/img/meals_bg.png"),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 30),
                      Text(
                        "Recipe for you",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 35),
                      Text(
                        "Name",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                SizedBox(width: 20),
                Text(
                  "Daily Calories",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MacroDaily(
                    nutrientName: "Calories",
                    dailyIntake: "$Calories\kcal",
                    imagePath: "assets/img/Calories-Icon.png",
                    bg_color: TColor.primaryG,),
                MacroDaily(
                    nutrientName: "Carbs",
                    dailyIntake: "$Carbs\gm",
                    imagePath: "assets/img/Carbo-Icon.png",
                    bg_color: TColor.primaryG,),
                MacroDaily(
                    nutrientName: "Fat",
                    dailyIntake: "$Fat\gm",
                    imagePath: "assets/img/Fat-Icon.png",
                    bg_color: TColor.secondaryG,),
                MacroDaily(
                    nutrientName: "Protein",
                    dailyIntake: "$Protein\gm",
                    imagePath: "assets/img/protein 1.png",
                    bg_color: TColor.primaryG,),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Text(
                    "Meals Calorie distribution",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 400,
                  margin: const EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: dummy.length,
                    itemBuilder: (context, index) {
                      final meal = dummy[index];
                      return MealCard(
                        img: meal.img,
                        Meal: meal.Meal,
                        Calories: meal.Calories,
                        Carbs: meal.Carbs,
                        Protein: meal.Protein,
                        Fat: meal.Fat,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
