import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
     return ThemeData(
       colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
       useMaterial3: true,

       elevatedButtonTheme: ElevatedButtonThemeData(
         style: ButtonStyle(
           shape: WidgetStateProperty.all<RoundedRectangleBorder>(
             RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(4),
             ),
           ),
         ),
       ),
       scrollbarTheme: ScrollbarThemeData(
         thumbColor: WidgetStateProperty.all(Colors.teal),
         thickness: WidgetStateProperty.all(4),
         radius: Radius.circular(4),
       ),
       iconTheme: IconThemeData(
         color: Colors.teal,
       ),
       drawerTheme: DrawerThemeData(

         ),
     );
  }
}