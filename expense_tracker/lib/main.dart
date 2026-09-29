import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:expense_tracker/widgets/expenses.dart';

const kNavy = Color(0xFF010736);
const kDarkBlue = Color(0xFF0D1C42);
const kBlue = Color(0xFF22396F);
const kCream = Color(0xFFFCF1D0);

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: kBlue,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: kCream,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: const AppBarTheme(
          backgroundColor: kNavy,
          foregroundColor: kCream,
        ),
        cardTheme: const CardThemeData(
          color: Colors.white,
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kBlue,
            foregroundColor: kCream,
          ),
        ),
      ),

      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: kBlue,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: kDarkBlue,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: const AppBarTheme(
          backgroundColor: kNavy,
          foregroundColor: kCream,
        ),
        cardTheme: const CardThemeData(
          color: kDarkBlue,
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kBlue,
            foregroundColor: kCream,
          ),
        ),
      ),

      themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
  );
}