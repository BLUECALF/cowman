import 'dart:convert';

import 'package:cowman/screens/controllers/livestock_contoller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gradient_ui_widgets/gradient_ui_widgets.dart' as a;
import 'package:flutter/material.dart';

import '../../database/database.dart';

class LivestockScreen extends GetView
{
 final LivestockController livestockController = Get.put(LivestockController());
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
          title: Text("Livestock"),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),

        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 30),

              StreamBuilder(
                stream: livestockController.database.getLivestockListStream(),
                  builder:(context,snapshot)
                  {
                    print("Snaphot.data is ${snapshot.data}");
                    if(snapshot.hasError || snapshot.isBlank == true || snapshot.data == null)
                      {print("Fail was called");return Text("Failed to get Livestock");}
                    List<Livestock> livestockList = snapshot.data as List<Livestock>;
                    return Column(
                      children:livestockList.map((e) {
                        print("MAP CODE WAS CALLED ");
                        print(livestockList);
                        return Center(
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("${e.name}"),
                                Image.memory(base64Decode(e.image),
                                  height:  Get.height/4,
                                  width: Get.width/2,
                                  fit: BoxFit.cover,
                                ),
                                Text("${e.breed}"),
                                Text("${e.dob}"),
                              ],
                            ),
                          ),
                        );
                      }
                      ).toList(),
                    );

                  }
              ),


            ],
          ),
        ),
      floatingActionButton: a.GradientFloatingActionButton(
        gradient: g2,
        child: Icon(Icons.add),
        onPressed: (){livestockController.add_livestock_dialog();},
      ),
    );


  }

}