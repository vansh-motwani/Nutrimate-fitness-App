import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nutrimate/Provider/meal_dishes.dart';
import 'package:nutrimate/common_widget/meal_desc.dart';
import 'package:nutrimate/view/meals/meals_detail.dart';

class MealTimeList extends StatefulWidget {
  const MealTimeList({super.key});

  @override
  State<MealTimeList> createState() => _MealTimeListState();
}

class _MealTimeListState extends State<MealTimeList> {
  @override
  Widget build(BuildContext context) {
    final helper = Provider.of<DishesDetails>(context);
    final String temp = helper.current_dishes[0]['meal_type'];
    final String header = temp[0].toUpperCase() + temp.substring(1);
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/img/Meal_timeBG.png',
                    fit: BoxFit.fill,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                      child: BackButton(),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    header,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Calories',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Image.asset(
                              'assets/img/Calories-Icon.png',
                              width: 20,
                              height: 20,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '550 Kcal',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'MACROS TO CONSUME',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MacroInfo(label: 'Carbs', value: '76gm'),
                            MacroInfo(label: 'Protein', value: '86gm'),
                            MacroInfo(label: 'Fat', value: '30gm'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Suggested dishes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Please review the macros for each dish and ensure you consume the recommended amounts',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Consumer<DishesDetails>(
                    builder: (context, list, child) => SizedBox(
                      height: 400, // Set a fixed height for the ListView
                      child: ListView.builder(
                        itemCount: (list.current_dishes.length / 2).floor(),
                        itemBuilder: (context, index) => DishCard(
                          dish: Dish(
                            name: list.current_dishes[index]['name'],
                            calories: list.current_dishes[index]['food_calorie'].toString(),
                          ),
                          meal: list.current_dishes[index],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MacroInfo extends StatelessWidget {
  final String label;
  final String value;

  const MacroInfo({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            //fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class DishCard extends StatelessWidget {
  final Dish dish;
  final Map<dynamic, dynamic> meal;
  const DishCard({required this.dish, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        tileColor: Colors.white,
        leading: Image.network(
          'https://via.placeholder.com/50',
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(dish.name),
        subtitle: Text('${dish.calories} Kcal'), // Display the calories correctly
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Navigate to detail page or perform any action
          Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) => MealDescriptionPage(mealData: meal)),
          );
        },
      ),
    );
  }
}

class Dish {
  final String name;
  final String calories;

  Dish({required this.name, required this.calories});
}
