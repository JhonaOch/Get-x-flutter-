
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_x_flutter/controllers/home_controller.dart';
import 'package:get_x_flutter/models/users.dart';
class HomeList extends StatelessWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'users',
      init: HomeController(),
      builder:(_) =>
      _.loading == true 
      ? const Center(child: LinearProgressIndicator())
      : ListView.builder(
             itemCount: _.users.length,    
            itemBuilder: (context, index){
              final Users user = _.users[index];
              return ListTile(
                title: Text(user.firstName as String),
                subtitle: Text(user.lastName as String),
                onTap: (){
                  _.showUserProfile(user);
                },
              );
    
            }
            ),
    );
  }
}