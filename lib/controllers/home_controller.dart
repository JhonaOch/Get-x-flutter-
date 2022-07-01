

import 'package:get/get.dart';
import 'package:get_x_flutter/api/users_api.dart';
import 'package:get_x_flutter/models/users.dart';
import 'package:get_x_flutter/pages/profile_page.dart';

class HomeController extends GetxController{
  int _counter = 0;
  List<Users> _users = [];
  bool _loading = true;

  int get counter => _counter;
  List<Users> get users => _users;
  bool get loading => _loading;

//TODO es como tener un initState en statefull widget
  @override
  void onInit() {
    super.onInit();

  }

  //TODO si el widget ya se renderizo en pantalla
  //Sirve para mostrar un dialogo o una nueva paginando
 @override
  void onReady() {
    super.onInit();
    loadUser();

  }

  Future<void> loadUser()async{
      final data=await UsersAPI.instance.getUsers(1);
      _users= data as List<Users>;
      _loading=false;
      update(
        ['users' ]
      );

  }
 

  void increment(){
    _counter++;
    update([
      'text'
    ],
    _counter>=10
    );
  }

  Future<void>showUserProfile(Users user)async{
    final result=await Get.to<String>(ProfilePage(), arguments: user);
    if(result!=null){
      print("Resulta $result");
    }
  }
}