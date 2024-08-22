import 'package:flutter/material.dart';
import 'package:nutrimate/Provider/number_of_mealsProvider.dart';
import 'package:provider/provider.dart';

class MealChange extends StatefulWidget {
  const MealChange({super.key});
  @override
  State<MealChange> createState() => _MealChangeState();
}

class _MealChangeState extends State<MealChange> {
  @override
  Widget build(BuildContext context) {
    final media=MediaQuery.of(context).size;
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Container(
            width: media.width * 0.85,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    "assets/img/meal 1.png",
                    width: 20,
                    height: 40,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: media.width * 0.7,
                    child: Consumer<MealCountProvider>(
                      builder:(ctx,value,child)=> DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: value.selectedMeal,
                          onChanged: (String? newValue) {
                            value.changeMealCount(newValue!);
                            value.sendData(newValue);
                          },
                          items: <String>['3 meals', '4 meals', '5 meals']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
  }
}