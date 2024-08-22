import 'package:flutter/material.dart';
import 'package:nutrimate/common/colo_extension.dart';
import 'package:nutrimate/common_widget/round_button.dart';
import 'package:nutrimate/view/on_boarding/on_boarding_view.dart';

class StartedView extends StatefulWidget {
  const StartedView({super.key});

  @override
  State<StartedView> createState() => _StartedViewState();
}

class _StartedViewState extends State<StartedView> {
  bool isChangeColor = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: Container(
        width: media.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: TColor.primaryG,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 2,
                ),
                Image.asset("assets/img/Group (2).png"),
                SizedBox(height: 40, width: 20),
                Text(
                  "Nutrimate",
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 36,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10, width: 20),
                Text(
                  "Body made in Kitchen",
                  style: TextStyle(
                    color: TColor.white,
                    fontSize: 18,
                  ),
                ),
                const Spacer(
                  flex: 3,
                ),
                SafeArea(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: RoundButton(
                            title: "Get Started",
                            type: RoundButtonType.textGradient,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const OnBoardingView()));
                            }))),
                SizedBox(
                  height: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
