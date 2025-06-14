import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class ColorsConst {
  ColorsConst._();

  static const topSubjectArticles = [
    Color.fromARGB(0, 13, 37, 60),
    Color.fromARGB(255, 13, 37, 60),
  ];
  static const bottomNavigationLikeArticle = [
    Color.fromARGB(0, 249, 250, 255),
    Color.fromARGB(255, 250, 251, 255),
  ];

  static const colorPrimery = Color.fromARGB(255, 55, 106, 237);
  static const colorDivider = Color.fromARGB(97, 123, 139, 178);
  static const colorbackgroundScaffold = Colors.white;
  
}

class FontSized {
  FontSized._();

  static TextStyle fontLarg = GoogleFonts.abel(
    color: Colors.black,
    fontSize: 22,
  );
  static TextStyle fontMediumLarg = GoogleFonts.abel(
    color: Colors.black,
    fontSize: 20,
  );
  static TextStyle fontMedium = GoogleFonts.abel(
    color: Colors.black,
    fontSize: 18,
  );
  static TextStyle fontLow = GoogleFonts.abel(
    color: Colors.black,
    fontSize: 14,
  );
  static TextStyle fontLowWhite = GoogleFonts.abel(
    color: Colors.white,
    fontSize: 16,
  );
  static TextStyle fontVeryLow = GoogleFonts.abel(
    color: Colors.black45,
    fontSize: 12,
  );
}

class ConstText {
  ConstText._();

  //onbording Screen

  static const concetArticleWrite =
      'Write the best article and share everything you know about the computer world. Always remember that this article is the beginning of the path for many (:';

  
}

//theme_Project
ThemeData dataTheme() {
  return ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateColor.resolveWith((callback) {
          if (callback.contains(WidgetState.pressed)) {
            return Colors.black;
          }
          return Colors.blue;
        }),
        animationDuration: const Duration(seconds: 1),
        shape: WidgetStatePropertyAll(
          ContinuousRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
      ),
    ),
    scaffoldBackgroundColor: ColorsConst.colorbackgroundScaffold,

    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontFamily: 'Avenir',
        fontWeight: FontWeight.w700,
        color: Colors.black,
        fontSize: 22,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Avenir',
        fontWeight: FontWeight.w700,
        color: Colors.white,
        fontSize: 18,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Avenir',
        fontWeight: FontWeight.w300,
        color: Colors.black,
        fontSize: 12,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Avenir',
        fontWeight: FontWeight.w700,
        color: Colors.white,
        fontSize: 16,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Avenir',
        fontWeight: FontWeight.w300,
        color: Colors.black,
        fontSize: 16,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Avenir',
        fontWeight: FontWeight.w700,
        color: Colors.black,
        fontSize: 18,
      ),
    ),
  );
}
