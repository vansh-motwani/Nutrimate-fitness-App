import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutrimate/Provider/number_of_mealsProvider.dart';
import 'package:nutrimate/common/colo_extension.dart';
import 'package:nutrimate/common_widget/macroCard.dart';
import 'package:nutrimate/common_widget/meal_dropdown.dart';
import 'package:nutrimate/common_widget/navigation_bar.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  final int Carbs = 126;
  final int Fat = 70;
  final int Protein = 180;
  final int Water = 10;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<MealCountProvider>(context);
    final int Calories = prov.Calories;
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset("assets/img/Vectorhome.png"),
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
                        "Welcome",
                        style: TextStyle(fontSize: 17, color: Colors.grey),
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
                SizedBox(width: 35),
                Text(
                  "Based on the information you provided ,",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                SizedBox(width: 35),
                Text(
                  "this is our basic analysis",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 30),
              Container(
                width: media.width * 0.85,
                height: media.height * 0.08,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: TColor.primaryG),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/img/Banner-Dots (1).png",
                      fit: BoxFit.fill,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 30),
                          const Text(
                            "Daily calories: ",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "$Calories",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 20),
              Text(
                "Nutrition Target per day",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MacroDaily(
                  nutrientName: "Carbs",
                  dailyIntake: "$Carbs gm",
                  imagePath: "assets/img/Carbo-Icon.png",
                  bg_color: TColor.primaryG, 
              ),
              MacroDaily(
                  nutrientName: "Fat",
                  dailyIntake: "$Fat gm",
                  imagePath: "assets/img/Fat-Icon.png",
                  bg_color: TColor.secondaryG,),
              MacroDaily(
                  nutrientName: "Protein",
                  dailyIntake: "$Protein gm",
                  imagePath: "assets/img/protein 1.png",
                  bg_color: TColor.primaryG,),
              MacroDaily(
                  nutrientName: "Water",
                  dailyIntake: "$Water litres",
                  imagePath: "assets/img/glass 1.png",
                  bg_color: TColor.secondaryG,),
            ],
          ),
          const SizedBox(height: 30),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 20),
              Text(
                "Meals Calorie distribution",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Expanded(
            child: MealDropdown(),
          ),
        ],
      ),
    );
  }
}
