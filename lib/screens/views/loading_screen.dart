
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../controllers/loading_controller.dart';

class LoadingScreen extends GetView{
  final loadingController  = Get.put(LoadingController());
  @override
  Widget build(BuildContext context) {

    loadingController.load_login();

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SpinKitCubeGrid(
                size: 100.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

}