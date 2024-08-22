import 'package:flutter/material.dart';
import 'package:nutrimate/Provider/number_of_mealsProvider.dart';
import 'package:nutrimate/common_widget/build_MealItem.dart';
import 'package:nutrimate/common_widget/meal_count_change.dart';
import 'package:provider/provider.dart';

class MealDropdown extends StatefulWidget {
  const MealDropdown({super.key});
  @override
  State<MealDropdown> createState() => _MealDropdownState();
}
class _MealDropdownState extends State<MealDropdown> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MealCountProvider>(
      builder: (context, value, child) => Column(
        children: [
          const MealChange(),
          if (value.isLoading)
            const Center(
              child: CircularProgressIndicator(),
            )
          else if (value.responseMap.isNotEmpty)
            if (int.parse(value.selectedMeal[0]) == 4)
              Expanded(
                child: ListView(
                  children: [
                    buildMealItem(
                      'Breakfast',
                      value.responseMap['breakfast_lower']!,
                      value.responseMap['breakfast_upper']!,
                    ),
                    buildMealItem(
                      'Morning Snack',
                      value.responseMap['morning_snack_lower']!,
                      value.responseMap['morning_snack_upper']!,
                    ),
                    buildMealItem(
                      'Lunch',
                      value.responseMap['lunch_lower']!,
                      value.responseMap['lunch_upper']!,
                    ),
                    buildMealItem(
                      'Dinner',
                      value.responseMap['dinner_lower']!,
                      value.responseMap['dinner_upper']!,
                    ),
                  ],
                ),
              )
            else if (int.parse(value.selectedMeal[0]) == 5)
              Expanded(
                child: ListView(
                  children: [
                    buildMealItem(
                      'Breakfast',
                      value.responseMap['breakfast_lower']!,
                      value.responseMap['breakfast_upper']!,
                    ),
                    buildMealItem(
                      'Morning Snacks',
                      value.responseMap['morning_snack_lower']!,
                      value.responseMap['morning_snack_upper']!,
                    ),
                    buildMealItem(
                      'Lunch',
                      value.responseMap['lunch_lower']!,
                      value.responseMap['lunch_upper']!,
                    ),
                    buildMealItem(
                      'Afternoon Snacks',
                      value.responseMap['afternoon_snack_lower']!,
                      value.responseMap['afternoon_snack_upper']!,
                    ),
                    buildMealItem(
                      'Dinner',
                      value.responseMap['dinner_lower']!,
                      value.responseMap['dinner_upper']!,
                    ),
                  ],
                ),
              )
            else if (int.parse(value.selectedMeal[0]) == 3)
              Expanded(
                child: ListView(
                  children: [
                    buildMealItem(
                      'Breakfast',
                      value.responseMap['breakfast_lower']!,
                      value.responseMap['breakfast_upper']!,
                    ),
                    buildMealItem(
                      'Lunch',
                      value.responseMap['lunch_lower']!,
                      value.responseMap['lunch_upper']!,
                    ),
                    buildMealItem(
                      'Dinner',
                      value.responseMap['dinner_lower']!,
                      value.responseMap['dinner_upper']!,
                    ),
                  ],
                ),
              )
        ],
      ),
    );
  }
}