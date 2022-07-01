

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_flutter/controllers/global_controller.dart';
import 'package:get_x_flutter/models/product.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final controller=  Get.find<GlobalController>();
    return GetBuilder<GlobalController>(
      id: 'products',
      builder: (_)=>
      ListView.builder(
        itemCount: _.products.length,
        itemBuilder:(__,index) {
          final Product product = _.products[index];
          return ListTile(
            title: Text(product.name as String),
            subtitle: Text(product.description as String),
            trailing: IconButton(
              onPressed:(){
                  _.onFavorite(index, !product.isFavorite);
              } ,
              icon: Icon(Icons.favorite,
              color :product.isFavorite ? Colors.red : Colors.grey,
              ),

              
             
            ),
            onTap: (){
              //_.showProductDetail(_.products[index]);
            },
          );
        }
        ),
    );
    
  }
}