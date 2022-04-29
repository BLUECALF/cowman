
import 'package:cowman/screens/views/livestock_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';


class HomeController extends GetxController{

  void view_livestock()
  {
    Get.to(() => LivestockScreen());
  }
}

