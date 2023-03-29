

import 'package:e_commerce_app/data/datasource/remote/dio/dio_client.dart';
import 'package:e_commerce_app/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  SplashRepo({required this.dioClient, required this.sharedPreferences});

  void initSharedData() async {
    if (!sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      sharedPreferences.setStringList(AppConstants.CART_LIST, []);
    }
  }

}
