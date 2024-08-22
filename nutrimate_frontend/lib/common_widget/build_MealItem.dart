import 'package:flutter/material.dart';
import 'package:nutrimate/common/colo_extension.dart';
import 'package:nutrimate/model/meal_image.dart';

class buildMealItem extends StatelessWidget {
  const buildMealItem(this.mealName,this.lower,this.upper,{super.key});
  final String mealName;
  final double lower;
  final double upper;
  
  @override
  Widget build(BuildContext context) {
    final double median = (lower + upper) / 2;
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(child: 
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: (mealName=='Lunch')?TColor.secondaryG:TColor.primaryG,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Image.asset(
                (mealName=='Breakfast')?MealImage.Breakfast.img
                :(mealName=='Lunch')?MealImage.Lunch.img
                :(mealName=='Dinner')?MealImage.Dinner.img
                :MealImage.Snacks.img,
              ),
            ),
          )),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mealName,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "(Min ${lower.toStringAsFixed(1)}; Max ${upper.toStringAsFixed(1)})",
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          const Spacer(),
          Text(
            median.toStringAsFixed(1),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.navigate_next),
        ],
      ),
    );
  }
}