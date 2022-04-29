import 'package:flutter/material.dart';

class MyTextField extends TextField {

  static TextField make() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 2),
          borderRadius: const BorderRadius.all(
            const Radius.circular(30),
          ),

        ),
        fillColor: Colors.greenAccent,
        filled:true,
        prefixIcon: Icon(Icons.security),


      ),

    );
  }
}
