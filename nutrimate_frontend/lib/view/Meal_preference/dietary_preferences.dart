import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:nutrimate/Provider/number_of_mealsProvider.dart';
import 'package:nutrimate/common/Urls.dart';
import 'package:nutrimate/common_widget/meal_count_change.dart';
import 'package:nutrimate/common_widget/navigation_bar.dart';
import 'package:nutrimate/common_widget/round_button.dart';
import 'package:nutrimate/data/user_details.dart';
import 'package:nutrimate/view/home/home.dart';
import 'package:provider/provider.dart';

class DietPreference extends StatefulWidget {
  const DietPreference({super.key});

  @override
  State<DietPreference> createState() => _DietPreferenceState();
}

class _DietPreferenceState extends State<DietPreference> {
  String? _selectedDiet;
  bool _isLoading = false;
  final Map<String, bool> _selectedMeat = {
    'Beef': false,
    'Pork': false,
    'Goat/Lamb': false,
    'Chicken': false,
    'Sea Food': false,
    'None': false,
  };
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/img/VectorPreference_bg.png",
                  fit: BoxFit.cover,
                  width: media.width,
                  height: media.height * 0.2,
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 90,
                          ),
                          Text(
                            "We are",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "almost there!",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Row(
              children: [
                SizedBox(width: 20),
                Text(
                  "Meals per day",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const MealChange(),
            const SizedBox(height: 10),
            const Row(
              children: [
                SizedBox(width: 20),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'What\'s your diet preference:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSingleChoiceOption(
                          'Vegetarian', 'assets/img/Carbo-Icon (1).png'),
                      _buildSingleChoiceOption('Vegan', 'assets/img/salad.png'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSingleChoiceOption(
                          'Non-Vegetarian', 'assets/img/image 7.png'),
                      _buildSingleChoiceOption(
                          'Veg + Eggs', 'assets/img/Group 10298.png'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Meat to avoid?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildMultipleChoiceOption('Beef', 'assets/img/beef.png'),
                      _buildMultipleChoiceOption('Pork', 'assets/img/Pork.png'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildMultipleChoiceOption(
                          'Goat/Lamb', 'assets/img/Goat.png'),
                      _buildMultipleChoiceOption(
                          'Chicken', 'assets/img/Chicken.png'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildMultipleChoiceOption(
                          'Sea Food', 'assets/img/Sea Food.png'),
                      _buildMultipleChoiceOption('None', null),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _isLoading == true
                      ? const CircularProgressIndicator()
                      : Consumer<MealCountProvider>(
                          builder: (ctx, value, child) => RoundButton(
                              title: 'Meal Preferences',
                              type: RoundButtonType.bgGradient,
                              onPressed: () async {
                                int temp = await _getCalories();
                                if (temp != 0) {
                                  value.ChangeCalories(temp);
                                  value.sendData(value.selectedMeal);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) => const BottomNavBar()));
                                }
                              }),
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSingleChoiceOption(String option, String imagePath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDiet = option;
        });
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: _selectedDiet == option
              ? Colors.blue.withOpacity(0.2)
              : Colors.transparent,
          border: Border.all(
            color: _selectedDiet == option ? Colors.blue : Colors.grey,
          ),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: 50,
              width: 50,
            ),
            const SizedBox(height: 5),
            Text(option),
          ],
        ),
      ),
    );
  }

  Widget _buildMultipleChoiceOption(String option, String? imagePath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMeat[option] = !_selectedMeat[option]!;
        });
      },
      child: Container(
        width: 180,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: _selectedMeat[option]!
              ? Colors.blue.withOpacity(0.2)
              : Colors.transparent,
          border: Border.all(
            color: _selectedMeat[option]! ? Colors.blue : Colors.grey,
          ),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(option),
            if (imagePath != null) const SizedBox(height: 5),
            if (imagePath != null)
              Image.asset(
                imagePath,
                height: 50,
                width: 50,
              ),
          ],
        ),
      ),
    );
  }

  Future<int> _getCalories() async {
    setState(() {
      _isLoading = true;
    });
    log(calorie_intake.toString());
    int Cal;
    try {
      final uri = Uri.parse(URLs().Url_calorie_in);
      final response = await http
          .post(
            uri,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(calorie_intake),
          )
          .timeout(const Duration(seconds: 20));
      log(response.body);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        // Handle successful response
        log("hi");
        log(response.body);
        Cal = jsonDecode(response.body);
        return Cal;
      } else {
        // Handle error response
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        log(responseData['error']);
        String errorMessage = responseData['error'] ?? 'Failed to submit data!';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    } catch (error) {
      // Handle network or other errors
      var jmd = json.decode(error.toString());
      log(jmd);
      print(userDetails);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $error')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
    return 0;
  }
}
