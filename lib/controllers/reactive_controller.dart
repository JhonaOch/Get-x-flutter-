
import 'dart:async';

import 'package:get/get.dart';
import 'package:get_x_flutter/controllers/socket_client_controller.dart';
import 'package:get_x_flutter/models/pet.dart';


class ReactiveController extends GetxController{

  RxInt counter =0.obs;
  RxString currentDate =''.obs;

  RxList<String> items=<String>[].obs;
  RxMap<String,dynamic> mapItems=<String,dynamic>{}.obs;

  Pet myPet = Pet(age:1,name:'Perro' ) ;

  StreamSubscription<String>? _subscription;

  @override
  void onInit() {
    super.onInit();
    final socketController=Get.find<SocketClientController>();

    _subscription=socketController.message.listen((data){
      //print("mesage $data");
    });
  }

  void increment(){
    counter.value ++;
  }

  void getDate(){
    currentDate.value = DateTime.now().toString();
  }

  void addItem(){
    items.add(DateTime.now().toString());

  }

  void removeItem(int index){
    items.removeAt(index);
  }

  void addMapItem(){
    final String key = DateTime.now().toString();
    mapItems.addAll({key:key});

  }

   void removeMapItem(String key){
    mapItems.remove(key);
  }

  void setPetAge(int age){
    myPet.age=age;
    //myPet.value= myPet.value.copyWith(age:age);


  }

}