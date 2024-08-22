import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nutrimate/common_widget/round_button.dart';
import 'package:nutrimate/view/Profile/activity_level.dart';
import 'package:nutrimate/view/Profile/macro_details.dart';

class CPF_requirement extends StatefulWidget {
  const CPF_requirement({super.key});

  @override
  State<CPF_requirement> createState() => _CPF_requirementState();
}

class _CPF_requirementState extends State<CPF_requirement> {
  String selectedOption = '';

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
                  "assets/img/Group 10295.png",
                  width: media.width,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Do you know what to eat to",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "match your Carbs, Protein ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "and fat requirement?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            _buildRadioButton(
                'Yes,',
                'I know what is my macros (C,P,F) but don’t know what food should I eat to meet those macros'),
            SizedBox(height: 20),
            _buildRadioButton(
                'No,',
                'I don’t know what is my macros (C,P,F) and don’t know what food should I eat'),
            SizedBox(height: 40,),
            RoundButton(
              title: "Next",
              onPressed: () {
                if (selectedOption == 'Yes,') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MacroDetails()),
                  );
                } else if (selectedOption == 'No,') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ActivityLevel()),
                  );
                }
              },
              type: RoundButtonType.bgGradient,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRadioButton(String option, String text) {
    bool isSelected = selectedOption == option;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = option;
        });
      },
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? const Color.fromARGB(255, 159, 194, 222) : Colors.white,
          border: Border.all(
            color: isSelected ? const Color.fromARGB(255, 159, 194, 222) : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Radio<String>(
              value: option,
              groupValue: selectedOption,
              onChanged: (String? value) {
                setState(() {
                  selectedOption = value!;
                });
              },
              activeColor: Color.fromARGB(255, 45, 132, 208),
            ),
            Text(
              option,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



