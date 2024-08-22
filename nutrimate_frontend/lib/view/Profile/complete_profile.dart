import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nutrimate/common_widget/round_button.dart';
import 'package:nutrimate/data/user_details.dart';
import 'package:nutrimate/view/Profile/cpf_req.dart';

class CompleteProfilePage extends StatefulWidget {
  @override
  _CompleteProfilePageState createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  final _formKey = GlobalKey<FormState>();

  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String gender = 'male';
  DateTime dateOfBirth = DateTime.utc(2002, 1, 1);
  double weight = 0;
  bool isWeightInKg = true;
  double height = 0;
  bool isHeightInCm = true;
  bool hidePassword = true;
  double feet = 0;
  double inches = 0;

  final TextEditingController weight_controller = TextEditingController();
  final TextEditingController feet_controller = TextEditingController();
  final TextEditingController inches_controller = TextEditingController();
  final TextEditingController cm_controller = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  int calculateAge(DateTime dob) {
    DateTime today = DateTime.now();
    int age = today.year - dob.year;

    if (today.month < dob.month ||
        (today.month == dob.month && today.day < dob.day)) {
      age--;
    }

    return age;
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != dateOfBirth) {
      setState(() {
        userDetails['dob'] = "${picked.year}-${picked.month}-${picked.day}";
        dateOfBirth = picked;
        calorie_intake['age_value'] = calculateAge(picked).toString();
        dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void cmToFeetAndInches() {
    double cm = double.tryParse(cm_controller.text) ?? 0;
    const double cmPerInch = 2.54;
    const double inchesPerFoot = 12;
      double totalInches = (cm / cmPerInch);
      int feet = totalInches ~/ inchesPerFoot;
      double inches = totalInches % inchesPerFoot;

      calorie_intake['feet'] ='$feet';
      calorie_intake['inches'] = '$inches';
      userDetails['feet'] = feet;
      userDetails['inches'] = inches;
      print('$feet $inches');
  }

  void _weight(bool f) {
    if (isWeightInKg == true) {
      double weight_curr = double.tryParse(weight_controller.text)??0;
      userDetails['weight'] = weight_curr; // Store as double
      const double lbsPerKg = 2.20462;
      int lbs_wt = (weight_curr * lbsPerKg).round();
      calorie_intake['lbs'] = lbs_wt.toString();
    } else{
      calorie_intake['lbs'] = weight_controller.text;
      const double kgPerLb = 0.453592;
      double temp = double.tryParse(weight_controller.text) ?? 0;
      int wt = (temp * kgPerLb).round();
      userDetails['weight'] = wt; // Store as double
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              Text(
                                "Hey there,",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Complete your profile",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          "assets/img/Vector-SectioncompProfile.png",
                          width: media.width,
                        )
                      ],
                    ),
                    SizedBox(height: 40),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Your Information",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    _buildTextField(
                      label: 'First Name',
                      icon: Icons.person,
                      onChanged: (value) => userDetails['first_name'] = value,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _buildTextField(
                      label: 'Last Name',
                      icon: Icons.person,
                      onChanged: (value) => userDetails['last_name'] = value,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _buildTextField(
                      label: 'Email',
                      icon: Icons.email,
                      onChanged: (value) => userDetails['email'] = value,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _buildPasswordField(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildGenderDropdown(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildDatePicker(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildWeightField(),
                    SizedBox(
                      height: 10,
                    ),
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     children: [
                    _buildHeightField(),
                    //       // Add more widgets here as needed
                    //     ],
                    //   ),
                    // ),
                    SizedBox(
                      height: 40,
                    ),
                    RoundButton(
                      title: "Let’s start cooking recipe",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Process data or send to backend
                          print({
                            'firstName': firstName,
                            'lastName': lastName,
                            'email': email,
                            'password': password,
                            'gender': gender,
                            'dateOfBirth': dateOfBirth,
                            'weight': weight,
                            'height': isHeightInCm
                                ? height
                                : {'feet': feet, 'inches': inches},
                            'weightUnit': isWeightInKg ? 'kg' : 'lbs',
                            'heightUnit': isHeightInCm ? 'cm' : 'ft/in',
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CPF_requirement()));
                        }
                      },
                      type: RoundButtonType.bgGradient,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required ValueChanged<String> onChanged,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onChanged: onChanged,
        keyboardType: keyboardType,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: Icon(Icons.lock),
            suffixIcon: IconButton(
              icon:
                  Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          obscureText: hidePassword,
          onChanged: (value) {
            userDetails['password'] = value;
            userDetails['confirm_password'] = value;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter password';
            } else if (value.length < 8) {
              return 'Password must be at least 8 characters long';
            } else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
              return 'Password should contain only alphanumeric characters';
            }
            return null;
          },
        ),
        SizedBox(height: 5),
        Text(
          'Must be 8 characters long and should contain only alphanumeric characters',
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildGenderDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Choose Gender',
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      value: gender,
      onChanged: (newValue) {
        setState(() {
          userDetails['gender'] = newValue;
          calorie_intake['sex'] = newValue!;
        });
      },
      items: ['male', 'female', 'other']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please select gender';
        }
        return null;
      },
    );
  }

  Widget _buildDatePicker() {
    return TextFormField(
      controller: dateController,
      decoration: InputDecoration(
        labelText: 'Date of Birth (DD/MM/YYYY)',
        prefixIcon: Icon(Icons.calendar_today),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please select date of birth';
        }
        return null;
      },
    );
  }

  Widget _buildWeightField() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: weight_controller,
            decoration: InputDecoration(
              labelText: 'Your Weight',
              prefixIcon: Icon(Icons.fitness_center),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) => _weight(isWeightInKg),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your weight';
              }
              return null;
            },
          ),
        ),
        SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 220, 135, 237),
          ),
          child: TextButton(
            onPressed: () {
              setState(() {
                isWeightInKg = !isWeightInKg;
                _weight(isWeightInKg);
              });
            },
            child: Text(
              isWeightInKg ? 'KG' : 'LBS',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeightField() {
    return isHeightInCm
        ? Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: cm_controller,
                  decoration: InputDecoration(
                    labelText: 'Your Height',
                    prefixIcon: Icon(Icons.height),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => cmToFeetAndInches(),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your height';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 220, 135, 237),
                ),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isHeightInCm = !isHeightInCm;
                    });
                  },
                  child: Text(
                    isHeightInCm ? 'CM' : 'FT/IN',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        : Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: feet_controller,
                  decoration: InputDecoration(
                    labelText: 'Feet',
                    prefixIcon: Icon(Icons.height),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    userDetails['feet'] = int.tryParse(feet_controller.text) ?? 0;
                    calorie_intake['feet'] = feet_controller.text;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter feet';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  controller: inches_controller,
                  decoration: InputDecoration(
                    labelText: 'Inches',
                    prefixIcon: Icon(Icons.height),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    userDetails['inches'] = int.tryParse(inches_controller.text) ?? 0;
                    calorie_intake['inches'] = inches_controller.text;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter inches';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 220, 135, 237),
                ),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isHeightInCm = !isHeightInCm;
                    });
                  },
                  child: Text(
                    isHeightInCm ? 'CM' : 'FT/IN',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          );
  }
}
