import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nutrimate/common/colo_extension.dart';
import 'package:nutrimate/common_widget/round_button.dart';
import 'package:nutrimate/view/login/otp_verification_sceen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isChecked = false;
  String? phoneController;
  String? cc;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/img/Group 10293Login.png",
                  width: media.width,
                  fit: BoxFit.fitWidth,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        child: Text(
                          "Let's make your",
                          style: TextStyle(
                              color: TColor.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          "kitchen discipline",
                          style: TextStyle(
                              color: TColor.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Login",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: IntlPhoneField(
                onChanged: (value){
                  phoneController=value.number;
                  cc=value.countryCode;},
                //controller: phoneController,
                initialCountryCode: 'IN',
                decoration: InputDecoration(
                  hintText: "Enter your contact number",
                  labelText: "Contact Number",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: 'By continuing you accept our ',
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(color: Colors.blue),
                            // Add your onTap functionality here
                            // recognizer: TapGestureRecognizer()..onTap = () {
                            //   // navigate to privacy policy
                            // }
                          ),
                          TextSpan(
                            text: ' and ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'Terms of Use',
                            style: TextStyle(color: Colors.blue),
                            // Add your onTap functionality here
                            // recognizer: TapGestureRecognizer()..onTap = () {
                            //   // navigate to terms of use
                            // }
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            (_isChecked)
                ? RoundButton(
                    title: "Send OTP",
                    type: RoundButtonType.bgGradient,
                    onPressed:()=> _onSendOtpPressed(context),
                  )
                : RoundButton(
                    title: "Send OTP",
                    type: RoundButtonType.bgSGradient,
                    onPressed: null,
                  ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Or',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              onPressed: _onGoogleSignInPressed,
              icon: Image.asset(
                'assets/img/google_icon.png', // Ensure you have a Google icon image in your assets
                height: 24,
                width: 24,
              ),
              label: Text('Login with Google'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white, // Text color
                side: BorderSide(color: Colors.black), // Border color
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onSendOtpPressed(BuildContext context) async{
    // Add your onPressed functionality here
    log(phoneController.toString());
    log(cc.toString());
    String verificationId="";
   // MaterialPageRoute(builder: (context)=>OtpVerification(verificationid: verificationID))
    String temp="+91 8528700687";
    log(temp.toString());
    Navigator.push(context,
              MaterialPageRoute(builder: (context) => OtpVerification(verificationid: verificationId)));
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //       verificationCompleted: (PhoneAuthCredential credential) async{
  //         debugPrint(credential.toString());
  //       },
  //       verificationFailed: (FirebaseAuthException ex) {
  //         debugPrint(ex.toString());
  //       },
  //       codeSent: (String verificationId, int? resendtoken) {
  //         debugPrint(resendtoken.toString());
  //         Navigator.push(context,
  //             MaterialPageRoute(builder: (context) => OtpVerification(verificationid: verificationId)));
  //       },
  //       codeAutoRetrievalTimeout: (String verificationId) {
  //         debugPrint(verificationId.toString());
  //       },
  //       phoneNumber: temp);
  }

  void _onGoogleSignInPressed() {
    // Add your Google sign-in functionality here
    print("Google Sign-In pressed");
  }
}
