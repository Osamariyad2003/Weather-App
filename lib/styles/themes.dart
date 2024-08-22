
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor :Colors.black,
    primaryColor: Colors.black,
    textSelectionTheme: TextSelectionThemeData(
        selectionColor: Colors.white,
        cursorColor: Colors.white),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,

      ),
      elevation: 0.0,
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Colors.black,

        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.light, // For Android (dark icons)
        statusBarBrightness: Brightness.dark, // For iOS (dark icons)
      ),


    ),

    inputDecorationTheme: InputDecorationTheme(

      focusColor: Colors.white,
        fillColor: Colors.white,

      border: OutlineInputBorder(
        // Set the border

        borderRadius: BorderRadius.circular(10.0), // Set border radius
        borderSide: BorderSide(color: Colors.black), // Set border color
      ),
      focusedBorder: OutlineInputBorder( // Set focused border
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.white),
      ),
// Define other decoration properties such as labelStyle, hintStyle, etc.
      labelStyle: TextStyle(color: Colors.white),
        helperStyle:TextStyle(color: Colors.white),

      hintStyle: TextStyle(color: Colors.grey),),

    iconTheme:   IconThemeData(
      color: Colors.white,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
        color: Colors.white
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.black,
    ),

    textTheme: TextTheme(
        bodyMedium: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),
        bodySmall: TextStyle(color: Colors.white),

    ),

    fontFamily: "Jannah"


);

ThemeData lightTheme = ThemeData(

    scaffoldBackgroundColor: Colors.white,

    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.white,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        ),

        elevation: 0.0,
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20
        )
    ),
      inputDecorationTheme: InputDecorationTheme(
        focusColor: Colors.black,
      border: OutlineInputBorder( // Set the border
      borderRadius: BorderRadius.circular(10.0), // Set border radius
       borderSide: BorderSide(color: Colors.white), // Set border color
        ),
focusedBorder: OutlineInputBorder( // Set focused border
borderRadius: BorderRadius.circular(10.0),
borderSide: BorderSide(color: Colors.black),
),
// Define other decoration properties such as labelStyle, hintStyle, etc.
labelStyle: TextStyle(color: Colors.black),
hintStyle: TextStyle(color: Colors.grey),),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Colors.black
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.black,
      selectionColor: Colors.white


    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.black,
      backgroundColor: Colors.white

    ),
    textTheme: TextTheme(
        bodyMedium: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600)
    ),

    fontFamily: "Jannah"


);