import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:nutrimate/common/Urls.dart';
class MealCountProvider extends ChangeNotifier{
  int Calories=2500;
  String selectedMeal='3 meals';
  Map<String, double> responseMap = {};
  bool isLoading = false;

  void ChangeCalories(int cal){
    Calories=cal;
    notifyListeners();
  }

  Future<void> sendData(String meals) async {
    isLoading = true;
    var url = Uri.parse(URLs().Url_calorie_dis);
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, int>{
        'calorie': Calories,
        'meals': int.parse(meals[0]),
      }),
    );

    if (response.statusCode == 200) {
        isLoading = false;
        responseMap = Map<String, double>.from(jsonDecode(response.body));
        print(responseMap);
    } else {
      isLoading = false;
      print('Request failed with status: ${response.statusCode}.');
    }
    notifyListeners();
     log(responseMap.toString());
  }

  void changeMealCount(String value){
    selectedMeal=value;
    notifyListeners();
  }
}