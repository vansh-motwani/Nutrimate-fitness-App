import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:nutrimate/common/colo_extension.dart';
import 'package:nutrimate/common_widget/round_button.dart';
import 'package:nutrimate/view/Profile/complete_profile.dart';

class OtpVerification extends StatefulWidget {
  final String verificationid;
  const OtpVerification({super.key, required this.verificationid});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  String otp = '';
  int _start = 30;
  bool _isButtonDisabled = true;
  Timer? _timer;
  TextEditingController otpcheck = TextEditingController();
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    setState(() {
      _isButtonDisabled = true;
      _start = 30;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _isButtonDisabled = false;
        });
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void resendCode() {
    startTimer();
    // Add your resend code functionality here
    print("Resend OTP code");
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 2,
          ),
          Stack(
            children: [
              Image.asset(
                "assets/img/Groupotp_page.png",
                width: media.width,
                fit: BoxFit.fitWidth,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: Text(
                        "Check for Code",
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
          SizedBox(height: 10),
          const Text(
            "We have sent a verification code to:",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          const Text(
            "Phone number",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: OtpTextField(
              numberOfFields: 6,
              keyboardType: TextInputType.number,
              borderColor: Color(0xFF512DA8),
              textStyle: TextStyle(fontSize: 16, color: Colors.black),
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              showFieldAsBox: true,
              onCodeChanged: (String code) {
                otp = code;
              },
            ),
          ),
          Text(
            _isButtonDisabled
                ? 'OTP will expire in $_start seconds'
                : 'Resend New OTP',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: _isButtonDisabled ? null : resendCode,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  _isButtonDisabled ? Colors.grey : Colors.white),
            ),
            child: Text(
              "Resend Code",
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          RoundButton(
            title: "Verify",
            onPressed: _submitOTP,
            type: RoundButtonType.bgGradient,
          )
        ]),
      ),
    );
  }

  void _submitOTP(){
    String otp_final = otp;
    //FirebaseAuth auth = FirebaseAuth.instance;

    // try {
      // PhoneAuthCredential credential = PhoneAuthProvider.credential(
      //     verificationId: widget.verificationid, smsCode: otp_final);
      // await auth.signInWithCredential(credential);
      Navigator.push(
          context,
          MaterialPageRoute(builder: (ctx) => CompleteProfilePage()));
    // } catch (e) {
    //   print(e.toString());
    // }
  }
}
