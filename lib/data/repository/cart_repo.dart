
import 'dart:convert';

import 'package:e_commerce_app/data/datasource/remote/dio/dio_client.dart';
import 'package:e_commerce_app/data/model/response/cart_model.dart';
import 'package:e_commerce_app/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo{
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  CartRepo({required this.dioClient, required this.sharedPreferences});


  List<CartModel> getCartList(){
    List<String>? carts=sharedPreferences.getStringList(AppConstants.CART_LIST);
    List<CartModel> cartList=[];
    carts!.forEach((cart)=>cartList.add
      (CartModel.fromJson(jsonDecode(cart))));
    return cartList;
  }

  void addToCartList(List<CartModel> cartProductList){
    List<String> carts=[];
    cartProductList.forEach((cartModel)=>carts.add(jsonEncode(cartModel)));
    sharedPreferences.setStringList(AppConstants.CART_LIST, carts);
  }


}
