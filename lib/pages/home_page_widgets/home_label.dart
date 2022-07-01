import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_flutter/controllers/home_controller.dart';

class HomeLabel extends StatelessWidget {
  const HomeLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: 'text', builder: (_) => Text(_.counter.toString()));
  }
}
