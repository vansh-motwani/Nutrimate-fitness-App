import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nutrimate/common/colo_extension.dart';
import 'package:nutrimate/common_widget/on_boarding_page.dart';
import 'package:nutrimate/view/login/login_page.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int selectPage = 0;
  PageController controller = PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.addListener(() {
      selectPage = controller.page?.round() ?? 0;

      setState(() {});
    });
  }

  List pageArr = [
    {
      "title": "Track what you eat",
      "subtitle":
          "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals",
      "image": "assets/img/Group 10287.png"
    },
    {
      "title": "Get Burn",
      "subtitle":
          "Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever",
      "image": "assets/img/Group (1).png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    //var media=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: Expanded(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            PageView.builder(
                controller: controller,
                itemCount: pageArr.length,
                itemBuilder: (context, index) {
                  var pObj = pageArr[index] as Map? ?? {};
                  return OnBoardingPage(pObj: pObj);
                }),
            SizedBox(
              width: 120,
              height: 120,
              child: Stack(
                alignment: Alignment.center,
                children: [
        
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: CircularProgressIndicator(
                      value: (selectPage+1)/2,
                      color: TColor.primaryColor1,
                      strokeWidth: 2,
                    ),
                  ),
        
                  Container(
                    width: 60,
                    height: 60,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    decoration: BoxDecoration(
                        color: TColor.primaryColor1,
                        borderRadius: BorderRadius.circular(35)),
                    child: IconButton(
                        onPressed: () {
                          if (selectPage < 1) {
                            selectPage += 1;
                            controller.animateToPage(selectPage,duration: Duration(milliseconds: 200),curve: Curves.bounceInOut);
                            //controller.jumpToPage(selectPage);
        
                            setState(() {
                              
                            });
                          } else {
                            //open welcome screen
                            print("Open Welcome Screen");
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()));
                          }
                        },
                        icon: Icon(
                          Icons.navigate_next,
                          color: TColor.white,
                        )),
                  ),
        
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
