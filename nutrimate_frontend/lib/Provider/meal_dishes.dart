import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nutrimate/common/Urls.dart';
class DishesDetails extends ChangeNotifier{
  List<Map<dynamic,dynamic>> current_dishes=[];
  bool isLoading=false;
  Future<void> onSubmit(Map<dynamic,dynamic> meal) async{
    isLoading=true;
    final response=await http.post(
      Uri.parse(URLs().Url_getFood),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(meal),
    );
    log(meal.toString());
    if (response.statusCode == 200) {
        isLoading = false;
        final List<dynamic> jsonResponse = json.decode(response.body);
        // Ensure all elements are Map<String, dynamic>
        //log(jsonResponse.toString());
        current_dishes= jsonResponse.map((e) => e as Map<dynamic, dynamic>).toList();
        log(current_dishes.isNotEmpty.toString());
        //print(responseMap);
    } else {
      isLoading = false;
      print('Request failed with status: ${response.statusCode}.');
      log(meal.toString());
    }
    notifyListeners();
  }
}