import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_flutter/controllers/reactive_controller.dart';
import 'package:get_x_flutter/controllers/socket_client_controller.dart';

class ReactivePage extends StatefulWidget {
  const ReactivePage({Key? key}) : super(key: key);

  @override
  State<ReactivePage> createState() => _ReactivePageState();
}

class _ReactivePageState extends State<ReactivePage> {
  @override
  Widget build(BuildContext context) {
    final socket=Get.find<SocketClientController>();
    return GetBuilder<ReactiveController>(
      init: ReactiveController(),
      builder: (_) => Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              CupertinoTextField(
                onChanged: (text){
                  socket.setSearchText(text);
                },
              ),


              //TODO Clase RxPet
              // Obx(
              //   () => Text("age ${_.myPet.age}"),
              // ),

Obx(
                () => Text("Message: ${socket.message.value}"),
              ),
              
              ElevatedButton(
                  onPressed: () {
                    _.setPetAge(_.myPet.age + 1);
                  },
                  child: Text('Set age'))
            ]),

        //TODO Para datos de tipo list

        // body:Obx(
        //   ()=>
        //   ListView(
        //     children:_.mapItems.values.map((e) =>
        //     ListTile(
        //       title: Text(e),
        //       trailing:
        //         IconButton(
        //           icon: Icon(Icons.delete),
        //           onPressed: (){
        //             _.removeMapItem(e);
        //           },
        //         ),
        //     )).toList(),

        //   ),
        // ),

        //TODO Para datos de lista
        //   ListView.builder(
        //     itemBuilder: (__,index){
        //       final String text = _.items[index];
        //       return ListTile(
        //         title: Text(text),
        //         trailing:
        //         IconButton(
        //           icon: Icon(Icons.delete),
        //           onPressed: (){
        //             _.removeItem(index);
        //           },
        //         ),

        //       );

        //     },

        //     itemCount: _.items.length,

        //   ),
        // ),

        //TODO Datos tipo string,double,int,date mediante datos reactivos
        // body: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Center(
        //       child: Obx(
        //         ()=> Text(_.counter.value.toString(),style: TextStyle(fontSize:30),)),
        //     ),

        //      Center(
        //       child: Obx(
        //         ()=> Text(_.currentDate.value,style: TextStyle(fontSize:30),)),
        //     ),
        //   ],
        // ),

//TODO FLOATING REMOVE AND ADD
        // floatingActionButton: Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //  // crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //   FloatingActionButton(
        //     heroTag: 'add',
        //     child: Icon(Icons.add),
        //     onPressed: () => //_.increment(),
        //    // _.addItem(),
        //     _.addMapItem(),
        //   ),
        //   SizedBox(height: 10),
        //   FloatingActionButton(
        //     heroTag: 'date',
        //     child: Icon(Icons.calendar_today),
        //     onPressed: () => _.getDate()),

        // ],)
      ),
    );
  }
}
