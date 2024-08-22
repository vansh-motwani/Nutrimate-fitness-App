import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nutrimate/common_widget/round_button.dart';
import 'package:nutrimate/view/meals/Similar_recipe.dart';

class MealDescriptionPage extends StatefulWidget {
  final Map<dynamic, dynamic> mealData;

  MealDescriptionPage({required this.mealData});

  @override
  _MealDescriptionPageState createState() => _MealDescriptionPageState();
}

class _MealDescriptionPageState extends State<MealDescriptionPage> {
  final ScrollController _scrollController = ScrollController();
  bool _showAppBar = false;
  bool _showButton = true;
  bool _atTop = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >= 200 && !_showAppBar) {
      setState(() {
        _showAppBar = true;
      });
    } else if (_scrollController.offset < 200 && _showAppBar) {
      setState(() {
        _showAppBar = false;
      });
    }

    if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      if (_showButton) {
        setState(() {
          _showButton = false;
        });
      }
    } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
      if (!_showButton) {
        setState(() {
          _showButton = true;
        });
      }
    }

    if (_scrollController.offset == 0 && !_atTop) {
      setState(() {
        _atTop = true;
        _showButton = true;
      });
    } else if (_scrollController.offset != 0 && _atTop) {
      setState(() {
        _atTop = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mealData = widget.mealData;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/paneer-butter-masala.jpg'), // Replace with your image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 50,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(2.5),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          mealData['name'] ?? '',
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text('${mealData['food_calorie'] ?? 0} KCAL'),
                        const SizedBox(height: 10),
                        const Text('Nutritional Information'),
                        const SizedBox(height: 5),
                        Text('Carbs: ${mealData['food_carbs'] ?? 0}g Protein: ${mealData['food_proteins'] ?? 0}g Fat: ${mealData['food_fats'] ?? 0}g'),
                        const SizedBox(height: 10),
                        const Text('Ingredients for 1 Serving'),
                        const SizedBox(height: 5),
                        Text(mealData['indigrients'] ?? ''),
                        const SizedBox(height: 20),
                        Text(
                          mealData['recipe'] ?? '',
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 20),
                        // Add more content here if needed
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_showAppBar)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.white,
                elevation: 4,
                title: const Text(
                  'Meal Description',
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: true,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          if (_showButton || _atTop)
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: RoundButton(
                  onPressed: () {
                    // Handle button action here
                    Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const SimilarPage()));
                  },
                  title: 'Similar recipes',
                  type: RoundButtonType.bgGradient,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

