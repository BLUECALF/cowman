
import 'package:cowman/screens/views/login_screen.dart';
import 'package:get/get.dart';

import '../../database/database.dart';


class LoadingController extends GetxController{
  void load_login() async
  {
    final database =  Get.put(MyDatabase());
    //final appController = Get.put(AppController());
    await Future.delayed(Duration(seconds: 4));
    Get.off(() => LoginScreen());
  }
}

