import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
      ),
      color:Color.fromARGB(255, 206, 31, 31),
      child: const Center(
        child: Icon(Icons.navigate_before),
      ),
    );
  }
}