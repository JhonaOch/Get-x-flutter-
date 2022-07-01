

import 'package:dio/dio.dart';

import '../models/users.dart';

class UsersAPI{

  UsersAPI._internal();
  static final UsersAPI _instance = UsersAPI._internal();
  static UsersAPI get instance=> _instance;

  final _dio = Dio();

  Future<List<Users>?> getUsers(int page)async{
    try{
      final Response response=await _dio.get('https://reqres.in/api/users',
      queryParameters: {
        'page': page,
        'delay':5
      }

      );
      return (response.data['data'] as List).map((e)
      => Users.fromJson(e)).toList();

 

    }catch(e){
      print(e);

      return null;
    }

  }
  
}