import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_flutter/controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder:(_)=> Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Center(
                child: Text('${_.user!.firstName} ${_.user!.lastName}'),
              ),
              SizedBox(height: 20),
              CupertinoTextField(
                placeholder: 'First Name',
                onChanged: _.onChangeText,
              
              ),
              SizedBox(height: 20),
              CupertinoButton(
                child: Text('Save'),
                onPressed: (){
                  _.goToBackWithData();
                },
              

              ),
            ],
          ),
        ),
      
      ),
    );
  }
}