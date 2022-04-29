import 'package:cowman/screens/controllers/home_controller.dart';
import 'package:cowman/styles/button_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gradient_ui_widgets/gradient_ui_widgets.dart' as a;
import 'package:flutter/material.dart';

class HomeScreen extends GetView
{
final HomeController homeController = Get.put(HomeController());
  //gradients to be used for decoration
  Gradient g1 = LinearGradient(
    colors: [
      Colors.green,
      Colors.lightGreenAccent,
    ],);
  Gradient g2 = LinearGradient(
    colors: [
      Colors.yellowAccent,
      Colors.deepOrange,
    ],);

  Gradient g3 = LinearGradient(
    colors: [
      Colors.blueAccent,
      Colors.blueGrey,
    ],);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: Column(
        children: [
          SizedBox(height: 30),
          Expanded(
            flex: 1,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
                  children: [
                    Container(
                      width: Get.width,
                      child: a.GradientElevatedButton(
                        gradient: g1,
                        onPressed: () {homeController.view_livestock();},
                        child: Text("Livestock"),
                        style: MyButtonDecoration.make(),
                      ),
                    ),
                    Container(
                      width: Get.width,
                      child: a.GradientElevatedButton(
                        gradient: g1,
                        onPressed: () {},
                        child: Text("Call Vet"),
                        style: MyButtonDecoration.make(),
                      ),
                    ),
                  ],
                ),
          ),
        ],
      )
      );


  }

}