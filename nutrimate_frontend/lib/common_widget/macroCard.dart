import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MacroDaily extends StatefulWidget {
  final String nutrientName;
  final String dailyIntake;
  final String imagePath;
  final List<Color> bg_color;

  const MacroDaily({
    required this.nutrientName,
    required this.dailyIntake,
    required this.imagePath,
    required this.bg_color,
    super.key,
  });

  @override
  State<MacroDaily> createState() => _MacroDailyState();
}

class _MacroDailyState extends State<MacroDaily> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 90,
            height: 70,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: widget.bg_color,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 1,),
                  Text(
                      widget.nutrientName,
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  const Spacer(flex: 2,),
                  Text(
                      widget.dailyIntake,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                    ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -25,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  widget.imagePath,
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}