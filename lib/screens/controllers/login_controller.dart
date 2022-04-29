
import 'package:cowman/screens/views/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';


class LoginController extends GetxController{
  void login(GlobalKey<FormBuilderState> _formKey)
  {
    bool? accepted = false;
    accepted = _formKey.currentState?.validate();
    _formKey.currentState?.save();
    var login_data =  _formKey.currentState?.value;

    print(login_data);
    /*final database =  Get.find(AppDatabase());
    final appController = Get.find(AppController());*/
    if(accepted == true){Get.to(() => HomeScreen()); _formKey.currentState?.reset();}

  }
}

