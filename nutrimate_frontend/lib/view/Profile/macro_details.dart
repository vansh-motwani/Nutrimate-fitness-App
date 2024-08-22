import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:nutrimate/common/colo_extension.dart';
import 'package:nutrimate/common_widget/round_button.dart';
import 'package:nutrimate/data/user_details.dart';
import 'package:nutrimate/view/Meal_preference/Preference1.dart';
import 'package:nutrimate/view/Profile/activity_level.dart';

class MacroDetails extends StatefulWidget {
  const MacroDetails({super.key});

  @override
  State<MacroDetails> createState() => _MacroDetailsState();
}

class _MacroDetailsState extends State<MacroDetails> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
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
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Please enter your target",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "nutrition",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: media.width * 0.8,
                height: media.height * 0.06,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    gradient:LinearGradient(colors: TColor.primaryG2)),

                child: Row(
                  children: [
                    Container(
                      width: media.height * 0.06,
                      child: Image.asset("assets/img/Carbo-Icon.png"),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black),
                          color: Color.fromARGB(118, 229, 226, 226),),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Carbohydrate",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 80,),
                    Container(
                      width: 50,
                      height: media.height*0.04,
                      child: TextFormField(
                        controller: _controller1,
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          //hintText: 'Enter integer value',
                          filled: true,
                          fillColor: Colors.white,
                          //contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text("gm",
                    style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),)
                  ],
                )),
                SizedBox(height: 20,),
                Container(
                width: media.width * 0.8,
                height: media.height * 0.06,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    gradient:LinearGradient(colors: TColor.secondaryG2)),
                child: Row(
                  children: [
                    Container(
                      width: media.height * 0.06,
                      child: Image.asset("assets/img/Fat-Icon.png"),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black),
                          color: Color.fromARGB(118, 229, 226, 226),),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Fat",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 150,),
                    Container(
                      width: 50,
                      height: media.height*0.04,
                      child: TextFormField(
                        controller: _controller2,
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          //hintText: 'Enter integer value',
                          filled: true,
                          fillColor: Colors.white,
                          //contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text("gm",
                    style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),)
                  ],
                )),
                SizedBox(height: 20,),
                Container(
                width: media.width * 0.8,
                height: media.height * 0.06,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    gradient:LinearGradient(colors: TColor.primaryG2)),
                child: Row(
                  children: [
                    Container(
                      width: media.height * 0.06,
                      child: Image.asset("assets/img/protein 1.png"),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black),
                          color: Color.fromARGB(118, 229, 226, 226),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Protein",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 125,),
                    Container(
                      width: 50,
                      height: media.height*0.04,
                      child: TextFormField(
                        controller: _controller3,
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          //hintText: 'Enter integer value',
                          filled: true,
                          fillColor: Colors.white,
                          //contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    const Text("gm",
                    style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),)
                  ],
                )),
                const SizedBox(height: 200,),
                RoundButton(title: "Next", onPressed: (){
                  userDetails['carbs']=int.parse(_controller1.text);
                  userDetails['proteins']=int.parse(_controller2.text);
                  userDetails['fats']=int.parse(_controller3.text);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const ActivityLevel()));
                },type: RoundButtonType.bgGradient,)
          ],
        ),
      ),
    );
  }
}
