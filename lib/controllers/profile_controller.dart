

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_flutter/models/users.dart';

class ProfileController extends GetxController{

Users? _user;

Users? get user => _user;

String _inputText='';

String get inputText => _inputText;


@override
  void onInit() {
    super.onInit();
    print("GET ARGUMENTS: ${Get.arguments}");
    _user=Get.arguments as Users;
  }

  void onChangeText(String text){
    _inputText=text;
  }

  void goToBackWithData(){
    if(_inputText.trim().length>0){
      Get.back(result:_inputText);
    }else{

      showCupertinoModalPopup(
        context: Get.overlayContext as BuildContext, 
        builder: (_)=>
        CupertinoActionSheet(
          title: Text("Error"),
          message: Text("Please enter a valid text"),
          actions: <Widget>[
            CupertinoActionSheetAction(
              onPressed: (){
                Get.back();
              },
              child: Text("Ok"),
            )
          ],
        )
        );

      // Get.snackbar("Error", "El campo no puede estar vacio",
      // snackPosition: SnackPosition.BOTTOM,
      // backgroundColor: Colors.red,
      // );

    }
   
  }




}