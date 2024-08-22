import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http; // Add this line
import 'package:nutrimate/common/Urls.dart';
import 'dart:convert';

import 'package:nutrimate/common_widget/round_button.dart';
import 'package:nutrimate/data/user_details.dart';
import 'package:nutrimate/view/Meal_preference/dietary_preferences.dart'; // Add this line

class Query1 extends StatefulWidget {
  const Query1({super.key});

  @override
  State<Query1> createState() => _Query1State();
}

class _Query1State extends State<Query1> {
  Map<String, bool> allergies = {
    "Gluten": false,
    "Nut": false,
    "Egg": false,
    "Fish": false,
    "Lactose/Milk": false,
    "Soya": false,
  };

  Map<String, bool> cuisines = {
    "American": false,
    "Chinese": false,
    "French": false,
    "Indian": false,
    "Italian": false,
    "Japanese": false,
    "Mexican": false,
    "Thai": false,
  };

  bool _isLoading = false;

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
                Align(
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
            Row(
              children: [
                SizedBox(width: 20),
                Text(
                  "Do you have any allergies?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            ..._buildAllergyOptions(),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 20),
                Text(
                  "Your cuisine preference?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            ..._buildCuisineOptions(),
            SizedBox(height: 40),
            _isLoading
                ? CircularProgressIndicator()
                : RoundButton(
                    title: "Meal Preference",
                    onPressed: _submitData,
                    type: RoundButtonType.bgGradient,
                  ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildAllergyOptions() {
    List<Widget> rows = [];
    List<String> keys = allergies.keys.toList();
    for (int i = 0; i < keys.length; i += 2) {
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildOption(keys[i], allergies),
            SizedBox(width: 20),
            if (i + 1 < keys.length) _buildOption(keys[i + 1], allergies),
          ],
        ),
      );
      rows.add(SizedBox(height: 20));
    }
    return rows;
  }

  List<Widget> _buildCuisineOptions() {
    List<Widget> rows = [];
    List<String> keys = cuisines.keys.toList();
    for (int i = 0; i < keys.length; i += 2) {
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildOption(keys[i], cuisines),
            SizedBox(width: 20),
            if (i + 1 < keys.length) _buildOption(keys[i + 1], cuisines),
          ],
        ),
      );
      rows.add(SizedBox(height: 20));
    }
    return rows;
  }

  Widget _buildOption(String option, Map<String, bool> optionsMap) {
    return GestureDetector(
      onTap: () {
        setState(() {
          optionsMap[option] = !optionsMap[option]!;
        });
      },
      child: Container(
        width: 180,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Checkbox(
              value: optionsMap[option],
              onChanged: (bool? value) {
                setState(() {
                  optionsMap[option] = value!;
                });
              },
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                option,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submitData() async {
    setState(() {
      _isLoading = true;
    });
    print(userDetails);
    // Prepare data to be sent
    
    Map<String, dynamic> sample = {
  "first_name": "Vansh",
  "last_name": "Motwani",
  "email": "vansh.student@gmail.com",
  "password": "12345",
  "confirm_password": "12345",
  "gender": "male",
  "dob": "2001-12-30",
  "feet": 5,
  "inches": 6,
  "weight": 58,
  "carbs": 0,
  "proteins": 0,
  "fats": 0,
  "goal": "weight gain",
  "desired_weight": 62,
  "activity_level": "Low Active",
  "meals_per_day": 3
};

    try {
      // Replace with your API endpoint
      final response = await http.post(
      Uri.parse(URLs().Url_saveData),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(userDetails),
      ).timeout(Duration(seconds:20));
      log(response.body);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        // Handle successful response
        String message=jsonDecode(response.body);
        if(message=='DATA SAVED'){
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data submitted successfully!')),
        );
        Timer(const Duration(seconds: 2),(){});
        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>DietPreference()));
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
        }
      }
      else {
        // Handle error response
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        log(responseData['error']);
        String errorMessage = responseData['error'] ?? 'Failed to submit data!';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    } 
    catch (error) {
      // Handle network or other errors
      var jmd = json.decode(error.toString());
      log(jmd);
      print(userDetails);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $error')),
      );
    } 
    finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}



