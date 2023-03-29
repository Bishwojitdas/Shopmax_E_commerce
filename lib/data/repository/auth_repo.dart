import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/datasource/remote/dio/dio_client.dart';
import 'package:e_commerce_app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:e_commerce_app/data/model/body/registration_model.dart';
import 'package:e_commerce_app/data/model/response/base/api_response.dart';
import 'package:e_commerce_app/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthRepo{
  DioClient dioClient;
  SharedPreferences sharedPreferences;

  AuthRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponse> registration(RegistrationModel register)async{
    try{
      Response response=await dioClient.post(AppConstants.REGISTRATION,
      data: register.toJson(),
      );
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> Login(String email, String pass)async{
    try{
      Response response=await dioClient.post(AppConstants.LOGIN,
      data: {"email":email, "password":pass},
      );
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  Future<ApiResponse> CustomerInfo()async{
    try{
      Response response=await dioClient.get(
        AppConstants.CUSTOMER_INFO,
      );
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<void> saveAuthToken(String token)async{
    dioClient.token=token;
    dioClient.dio.options.headers={
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
    try{
     await sharedPreferences.setString(AppConstants.TOKEN, token);
    }catch (e){
      throw e;
    }
  }


  Future<void> setIsLogin(bool isLogin) async{
    await sharedPreferences.setBool(AppConstants.IS_LOGIN, isLogin);
  }

  bool getIsLogin() {
    return  sharedPreferences.getBool(AppConstants.IS_LOGIN)?? false;
  }

}