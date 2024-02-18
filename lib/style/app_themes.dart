import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class Themes {

  static ThemeData lightTheme = ThemeData(
      colorScheme: const ColorScheme.light(
        primary: AppTheme.primaryColor,
      ),
      iconTheme: const  IconThemeData(
          color:  AppTheme.black
      ),
      buttonTheme:const ButtonThemeData(
          buttonColor: AppTheme.primaryColor
      ),
      scaffoldBackgroundColor: AppTheme.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppTheme.white,
        iconTheme: IconThemeData(
          color: AppTheme.black
        ),
        titleTextStyle: TextStyle(
          color: AppTheme.darkMood,
          fontSize: 20
        ),
        systemOverlayStyle:  SystemUiOverlayStyle( // the place of wifi card &...
          statusBarColor: AppTheme.primaryColor,
          // statusBarColor: AppTheme.white,
        ),
      ),
      dialogBackgroundColor: AppTheme.greyBetween,
      toggleButtonsTheme: const ToggleButtonsThemeData(
          selectedBorderColor: Colors.transparent,
          borderColor: Colors.transparent,
          fillColor: AppTheme.black
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colors.pink),
        fillColor: MaterialStateProperty.all(AppTheme.textColor),
      ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppTheme.white
    ),
  );

  static ThemeData darkTheme = ThemeData(
      colorScheme: const ColorScheme.dark(
        primary: AppTheme.white,
        primaryContainer: Colors.amber
      ),
      iconTheme: const  IconThemeData(
          color:  AppTheme.white
      ),
      buttonTheme:const ButtonThemeData(
          buttonColor: AppTheme.lightText
      ),
      scaffoldBackgroundColor: AppTheme.darkMood,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppTheme.darkMood,
        systemOverlayStyle:  SystemUiOverlayStyle(
          // statusBarColor: AppTheme.greyLite,
          statusBarColor: AppTheme.darkMood,
        ),
      ),
      dialogBackgroundColor: AppTheme.greyBetween,
      toggleButtonsTheme: const ToggleButtonsThemeData(
          selectedBorderColor: Colors.transparent,
          borderColor: Colors.transparent,
          fillColor: AppTheme.black
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colors.pink),
        fillColor: MaterialStateProperty.all(AppTheme.textColor),
      ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0.0,
        backgroundColor: AppTheme.black
    ),


  );


}