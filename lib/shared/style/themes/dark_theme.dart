import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../colors.dart';

//ToDo: will change color
// const dPrimaryColor = Color(0xff192734);
// const dSecColor = Color(0xff22303c);
//const dThirdColor = Colors.blue;

ThemeData darkTheme() {
  return ThemeData.dark().copyWith(
      primaryColor: dPrimaryColor,
      scaffoldBackgroundColor: dPrimaryColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: dThirdColor),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: Colors.white),

        color: dPrimaryColor,
        centerTitle: false,
        // backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: dPrimaryColor,
            systemNavigationBarColor: dSecColor,
            statusBarIconBrightness: Brightness.light,
            // systemNavigationBarDividerColor: Colors.blue,
            systemNavigationBarIconBrightness: Brightness.light),
      ),
      iconTheme: const IconThemeData(color: Colors.black, size: 25),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: dSecColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: dThirdColor,
        // elevation: 10,
      ));
}
