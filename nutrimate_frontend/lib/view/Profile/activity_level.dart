import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nutrimate/common_widget/round_button.dart';
import 'package:nutrimate/data/user_details.dart';
import 'package:nutrimate/view/Meal_preference/Preference1.dart';

class ActivityLevel extends StatefulWidget {
  const ActivityLevel({super.key});

  @override
  State<ActivityLevel> createState() => _ActivityLevelState();
}

class _ActivityLevelState extends State<ActivityLevel> {
  int _selectedWeightGoalIndex = -1; // No weight goal container selected initially
  int _selectedActivityLevelIndex = -1; // No activity level container selected initially
  TextEditingController _weightController = TextEditingController();
  bool isWeightInKg = true;

  final  List<String> _activity=[
    "Inactive",
    "Low Active",
    "Active",
    "Very Active",
  ];

  final List<String> _weightgoals=[
    "weight loss",
    "weight gain",
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  child: Image.asset("assets/img/Goal_Vector.png"),
                  height: media.width * 0.3,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Let’s set the target",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
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
                  "What is your goal?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildWeightGoalContainer(
                      0, 'assets/img/lady_2_.png', 'Weight Loss'),
                  SizedBox(width: 20),
                  _buildWeightGoalContainer(
                      1, 'assets/img/man.png', 'Weight Gain'),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "What’s your desired weight?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 20),
                Expanded(
                  child: TextFormField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.monitor_weight),
                      labelText: 'Your Desired weight',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 220, 135, 237),
                  ),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        isWeightInKg = !isWeightInKg;
                      });
                    },
                    child: Text(
                      isWeightInKg ? 'KG' : 'LBS',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 40),
              ],
            ),
            SizedBox(height: 40),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "What’s your activity level?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildActivityLevelContainer(
                          0, 'assets/img/Group 9885Sedentary.png', 'Sedentary'),
                      SizedBox(width: 20),
                      _buildActivityLevelContainer(
                          1, 'assets/img/Group 9886Light_active.png', 'Light Active'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildActivityLevelContainer(
                          2, 'assets/img/Group 9888Moderate Active.png', 'Moderate Active'),
                      SizedBox(width: 20),
                      _buildActivityLevelContainer(
                          3, 'assets/img/Group 9887Super_Active.png', 'Super Active'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            RoundButton(title: "Meal Preference", onPressed: (){
              userDetails['goal']=_weightgoals[_selectedWeightGoalIndex];
              userDetails['desired_weight']=int.parse(_weightController.text);
              userDetails['activity_level']=_activity[_selectedActivityLevelIndex];
              calorie_intake['activity_level']=_activity[_selectedActivityLevelIndex];
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Query1()));
            },type: RoundButtonType.bgGradient,),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }

  Widget _buildWeightGoalContainer(int index, String imagePath, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedWeightGoalIndex = index;
        });
      },
      child: Container(
        width: 180,
        height: 350,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              imagePath,
              height: 200,
              width: 150,
            ),
            SizedBox(height: 20),
            Text(
              text,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            Radio(
              value: index,
              groupValue: _selectedWeightGoalIndex,
              onChanged: (int? value) {
                setState(() {
                  _selectedWeightGoalIndex = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityLevelContainer(int index, String imagePath, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedActivityLevelIndex = index;
        });
      },
      child: Expanded(child:Container(
        width: 150,
        height: 200,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              imagePath,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            Radio(
              value: index,
              groupValue: _selectedActivityLevelIndex,
              onChanged: (int? value) {
                setState(() {
                  _selectedActivityLevelIndex = value!;
                });
              },
            ),
          ],
        ),
      ),),
    );
  }
}
