import 'dart:io';
import 'dart:typed_data';
import 'package:cowman/database/database.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'dart:convert';
import "package:flutter/material.dart";
import '../../styles/button_decoration.dart';
import '../../styles/text_field_decoration.dart';
import 'package:gradient_ui_widgets/gradient_ui_widgets.dart' as a;
import 'package:image_picker/image_picker.dart';

class LivestockController extends GetxController{
  final database = Get.find<MyDatabase>();
  void add_livestock_dialog() async
  {
    final ImagePicker _picker = ImagePicker();
    dynamic file = null;
    var counter = 0.obs;
    XFile? image;
    String image_string = "";
    List<int> image_bytes;
    final _formKey2 = GlobalKey<FormBuilderState>();
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

    Get.defaultDialog(
      title: "Add Livestock",
      content: Column(
        children: [
          Container(
            child: FormBuilder(
              key: _formKey2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width,
                    child: a.GradientElevatedButton(
                      gradient: g2,
                      onPressed: () async {
                        image =  await _picker.pickImage(source: ImageSource.gallery);
                        if(image != null)
                         { file = File(image!.path);
                           image_bytes =  await image!.readAsBytes();
                           image_string = base64Encode(image_bytes);
                           Uint8List decoded = base64Decode(image_string);
                           File image2 = await File.fromRawPath(decoded);
                           Get.defaultDialog(
                             title: "image2",
                             content: Image.memory(decoded)
                           );
                           print(decoded);
                           print(image_bytes);
                           print("##\n\n\ $image_string");
                         }
                        update();
                      },
                      child: Text(" Pick an image"),
                      style: MyButtonDecoration.make(),
                    ),
                  ),
                 SizedBox(height: 20),
                 GetBuilder<LivestockController>(builder: (_)
                 {
                   if (file != null)
                   return  Image.file(file,
                     height:  200,
                     width: double.infinity,
                     fit: BoxFit.cover,
                   );
                   else
                     {return Text("You have not chosen a image");}

                 }),


                  SizedBox(height: 20),
                  FormBuilderTextField(
                    name: "name",
                    decoration: MyTextFieldDecoration.make("Name"),
                    validator: (val) {
                      if (val == "")
                        return "Name is required";
                    },
                  ),
                  SizedBox(height: 20),
                  FormBuilderTextField(
                    name: "breed",
                    decoration: MyTextFieldDecoration.make("Breed"),
                    validator: (val) {
                      if (val == "")
                        return "Breed is required";
                    },
                  ),
                  FormBuilderDateTimePicker(
                    name: "dob",
                    fieldHintText: "Date of birth",
                    validator: (val) {
                      if (val == "")
                        return "date of birth is required";
                    },
                  ),

                Obx(
                  () => Text("clicks :$counter"),),
                  SizedBox(height: 20),
                  Container(
                    width: Get.width,
                    child: a.GradientElevatedButton(
                      gradient: g2,
                      onPressed: ()  async {
                      bool? accepted = _formKey2.currentState?.validate();
                      if(accepted==true && image_string != "")
                      {
                        _formKey2.currentState?.save();

                        Map<String, dynamic>? formData = _formKey2.currentState?.value;

                          List<Livestock> livestockList = await database.getLivestockList();
                          int id = livestockList.length + 1;

                          Livestock l = Livestock(
                              id: id,
                              name: formData!["name"],
                              image: image_string,
                              breed:  formData["breed"],
                              dob:  formData["dob"]);

                          // insert the livestock to db
                        int record_no =  await database.insertLivestock(l);
                        print("Record no is $record_no");
                        }
                      },
                      child: Text("Submit"),
                      style: MyButtonDecoration.make(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget render_livestock(List<Livestock> list) {

    list.map((e) {

      Uint8List image_bytes = base64Decode(e.image);

      return Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("${e.name}"),
                Image.memory(image_bytes,
                  height:  200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Text("${e.breed}"),
                Text("${e.dob}"),
              ],
            ),
          ),
        );
    }
    );

    return Text("There are no Livestock Currently");
  }
  // image ,name ,breed

}


