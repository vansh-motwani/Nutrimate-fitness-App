
import 'package:flutter/material.dart';

class TColor {
  static Color get primaryColor1 => const Color(0xff92A3FD);
  static Color get primaryColor2 => const Color(0xff9DCEFF);

  static Color get secondaryColor1 => const Color(0xffC58BF2);
  static Color get secondaryColor2 => const Color(0xffEEA4CE);


  static List<Color> get primaryG => [ primaryColor2, primaryColor1 ];
  static List<Color> get secondaryG => [secondaryColor2, secondaryColor1];
  static List<Color> get whiteg => [white, gray];

  static Color get primaryColor3 => Color.fromARGB(255, 244, 245, 245);
  static Color get primaryColor4 => Color.fromARGB(255, 225, 229, 244);

  static Color get secondaryColor3 => Color.fromARGB(255, 237, 219, 236);
  static Color get secondaryColor4 => const Color(0xffEEA4CE);


  static List<Color> get primaryG2 => [ primaryColor3, primaryColor4 ];
  static List<Color> get secondaryG2 => [secondaryColor3, secondaryColor4];

  static Color get black => const Color(0xff1D1617);
  static Color get gray => const Color(0xff786F72);
  static Color get white => Colors.white;
  static Color get lightGray => const Color(0xffF7F8F8);


}