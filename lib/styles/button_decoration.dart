import 'package:flutter/material.dart';

class MyButtonDecoration extends ButtonStyle {

  static ButtonStyle make()
  {
    return ButtonStyle(
      padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
      elevation: MaterialStateProperty.all(12),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
    );
  }
}
