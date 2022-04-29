import 'package:cowman/screens/controllers/login_controller.dart';
import 'package:cowman/styles/button_decoration.dart';
import 'package:cowman/styles/text_field_decoration.dart';
import 'package:get/get.dart';
import 'package:gradient_ui_widgets/gradient_ui_widgets.dart' as a;
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/material.dart';

class LoginScreen extends GetView
{
  final _formKey = GlobalKey<FormBuilderState>();
  final LoginController loginController = Get.put(LoginController());

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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: a.GradientCard(
        gradient: g1,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: Get.height,
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 50),
                      CircleAvatar(
                        backgroundImage: AssetImage("images/cow_w_mlk.png"),
                        backgroundColor: Colors.lightGreenAccent,
                        radius: 70,
                        ),
                      SizedBox(height: 20),
                      FormBuilderTextField(
                        name: "username",
                        decoration: MyTextFieldDecoration.make("Username"),
                        validator: (val){
                          if(val == "")
                            return "Username is required";
                        },
                      ),
                      SizedBox(height: 20),
                      FormBuilderTextField(
                          name: "password",
                          decoration: MyTextFieldDecoration.make("Password"),
                        validator: (val){
                          if(val == "")
                            return "Password is required";
                        },
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: Get.width,
                        child: a.GradientElevatedButton(
                          gradient: g2,
                          onPressed: () {loginController.login(_formKey);},
                          child: Text("Login"),
                          style: MyButtonDecoration.make(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}