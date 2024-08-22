import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Nutrients extends StatelessWidget {
  const Nutrients({super.key,required this.title,required this.subtitle});

  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(title),
        Text(subtitle)
      ],
    );
  }
}