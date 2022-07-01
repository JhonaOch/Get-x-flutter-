

import 'dart:async';

import 'package:faker/faker.dart';
import 'package:get/state_manager.dart';

class SocketClientController extends GetxController{

  RxString _message = ''.obs;
  RxString _searchText=''.obs;
  Timer? _timer,_timerCounter;
  final _faker = Faker();

  RxString get message => _message;


  @override
  void onInit() {
    super.onInit();
    init();

  }

  init() {

    //TODO SON FUNCIONES: WORKER

//TODO WORKER CADA VEZ QUE HAY UN CAMBIO EN EL OBSERVABLE EVER

      // ever(_searchText, (_){

      //   print("allalala");

      // });

//TODO WORKER SOLO IMPRIMIRA EL VALOR UNA VEZ

      // once(_counter, (_){

      //   print("has been counter${_counter.value}");

      // });

    //TODO EJECUTA DESPUES DE CIERTO TIEMPO

  // debounce(_searchText, (_){

  //       print(_searchText.value);

  //     },time: Duration(milliseconds: 500));



  //TODO EJECUTA DESPUES DE CADA CARACTER INGRESADO
       interval(_searchText, (_){

        print(_searchText.value);

      },time: Duration(milliseconds: 500));


    _timer=Timer.periodic(Duration(seconds:5), (timer) {

      _message.value=_faker.lorem.sentence() ;

     });

    //  _timer=Timer.periodic(Duration(seconds:1), (timer) {

    //   _counter.value++;

    //  });
  }

  @override
  void onClose() {
    super.onClose();

    if(_timer != null) {
        _timer?.cancel();

    }
    
    // if(_timerCounter != null) {
    //     _timerCounter?.cancel();

    // }

  
  }

  setSearchText(String text){
    _searchText.value=text;

  }




}