

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get_x_flutter/controllers/global_controller.dart';
import 'package:get_x_flutter/controllers/home_controller.dart';
import 'package:get_x_flutter/widgets/products_list.dart';



class HomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomeController>(

      init: HomeController(),
      builder: (_) {
        print("Build HomePage");
        return Scaffold(

          appBar: AppBar(
            actions: [
              GetBuilder<GlobalController>(
                id: 'favorites',
                builder: (_) =>
                 ElevatedButton(
                  child: Text("Favoritos: (${_.favorites.length})"),
                  onPressed: (){

                  }, ),
              ),
            ],
          ),
        //body:const HomeList(),
        body:ProductsList(),
        floatingActionButton:FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: (){
            _.increment();
          

          },
        ));
      }
      );
      
    
  }
}