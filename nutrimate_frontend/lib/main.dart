import 'package:flutter/material.dart';
import 'package:nutrimate/Provider/meal_dishes.dart';
import 'package:nutrimate/Provider/number_of_mealsProvider.dart';
import 'package:nutrimate/common/colo_extension.dart';
import 'package:nutrimate/common_widget/meal_desc.dart';
import 'package:nutrimate/common_widget/navigation_bar.dart';
import 'package:nutrimate/firebase_options.dart';
import 'package:nutrimate/view/Meal_preference/dietary_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nutrimate/view/home/home.dart';
import 'package:nutrimate/view/on_boarding/started_view.dart';
import 'package:provider/provider.dart';

void main() async{
  // firebse initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
// root level build.gradel
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
       ChangeNotifierProvider(
       create:(_)=>MealCountProvider()),
       ChangeNotifierProvider(
       create:(_)=>DishesDetails()),
    ],
    child: MaterialApp(
        title: 'Nutrimate',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: TColor.primaryColor1,
          fontFamily: "Poppins"
        ),
        home: const StartedView(),
      )
    );
  }
}