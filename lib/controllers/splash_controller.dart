

import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get_x_flutter/pages/home_page.dart';

class SplashController extends GetxController{


@override
  void onReady() {
    super.onReady();

    Future.delayed(Duration(seconds: 3), () {
      Get.off(HomePage(),transition: Transition.zoom);
    });
  }

//TODO Cerrar como una reproductcion de video
  @override
  void onClose() {
    super.onClose();
  }



}