import 'package:expense/expenses.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 56, 181));
var kDarkColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 5, 56, 125));

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   //UI only gets applied once the orientation gets locked in/ui dosent get roated
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      colorScheme: kDarkColorScheme,
      cardTheme: const CardTheme().copyWith(
        //cut from below and pasted here in darkTheme
        color: kDarkColorScheme.secondaryContainer,
        margin: const EdgeInsets.all(10),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kDarkColorScheme.primaryContainer, //outside
          foregroundColor: kDarkColorScheme.onPrimaryContainer, //inside
        ),
      ),
    ), // darkTheme

    theme: ThemeData().copyWith(
      colorScheme: kColorScheme,
      appBarTheme: AppBarTheme().copyWith(
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.primaryContainer,
      ),
    ),
    themeMode: ThemeMode.system,
    home: Expenses(),
  ));
  //});
}
