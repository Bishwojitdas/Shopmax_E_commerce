import 'dart:developer';

import 'package:e_commerce_app/data/datasource/remote/dio/dio_client.dart';
import 'package:e_commerce_app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:e_commerce_app/data/model/body/registration_model.dart';
import 'package:e_commerce_app/data/model/response/base/api_response.dart';
import 'package:e_commerce_app/data/model/response/login_response.dart';
import 'package:e_commerce_app/data/repository/auth_repo.dart';
import 'package:e_commerce_app/view/screen/dashboard/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AuthProvider with ChangeNotifier{
  AuthRepo authRepo;
  AuthProvider({required this.authRepo});

  User? _user;
  User? get user=>_user;


  Future register(RegistrationModel registrationModel)async{
    ApiResponse response=await authRepo.registration(registrationModel);
    if(response.response!=null && response.response!.statusCode==200){
      debugPrint("Registration Success");
      EasyLoading.showSuccess("Registration Success");
    }else{
      EasyLoading.showError(ApiErrorHandler.getMessage(response));
    }
  }

  Future CustomerInfo()async{
    ApiResponse response=await authRepo.CustomerInfo();
    if(response.response!=null && response.response!.statusCode==200){
      debugPrint("Customer Info: ${response.response!.data}");
      _user= await User.fromJson(response.response!.data);
      debugPrint("Customer Info: $_user");
      EasyLoading.showSuccess("Customer Info Created");
    }else{
      EasyLoading.showError(ApiErrorHandler.getMessage(response));
    }
  }

  Future login(BuildContext context, String email, String pass)async{
    ApiResponse response=await authRepo.Login(email, pass);
    if(response.response!=null && response.response!.statusCode==200){
      Map map=response.response!.data;
      String token=map["auth_token"];
      authRepo.saveAuthToken(token);
      authRepo.setIsLogin(true);
      debugPrint("Token: $token");
      log("token: $token");
      Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen(),));
      EasyLoading.showSuccess("Login Success");
    }else{
      EasyLoading.showError(ApiErrorHandler.getMessage(response));
    }
  }

  getIsLogin(){
    return authRepo.getIsLogin();
  }

}