import "package:flutter/material.dart";

class MyTextFieldDecoration extends InputDecoration {
static InputDecoration make(String hint){
 return  InputDecoration(
  border: OutlineInputBorder(
  borderSide: BorderSide(width: 2),
  borderRadius: const BorderRadius.all(
  const Radius.circular(20),
  ),

  ),
  fillColor: Color.fromRGBO(200, 200, 200, 0.9),
  filled:true,
  hintText: hint,


  );}
}
