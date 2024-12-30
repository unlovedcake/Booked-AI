import 'package:flutter/material.dart';

class AppColors {
  // Define static colors
  static const Color primary = Color(0xFFd9e5ff);
  static const Color primary100 = Color(0xFFe7f7fc);
  static const Color textSecondary = Color(0xFF2d62ff);
  static const Color bgFooter = Color(0xFF021430);

  static const Map<int, Color> _steelBlueColorMap = {
    50: Color.fromRGBO(63, 125, 178, .1),
    100: Color.fromRGBO(63, 125, 178, .2),
    200: Color.fromRGBO(63, 125, 178, .3),
    300: Color.fromRGBO(63, 125, 178, .4),
    400: Color.fromRGBO(63, 125, 178, .5),
    500: Color.fromRGBO(63, 125, 178, .6),
    600: Color.fromRGBO(63, 125, 178, .7),
    700: Color.fromRGBO(63, 125, 178, .8),
    800: Color.fromRGBO(63, 125, 178, .9),
    900: Color.fromRGBO(63, 125, 178, 1),
  };

  static const MaterialColor materialSteelBlue = MaterialColor(0xFF3F7DB2, _steelBlueColorMap);
}
