import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:e_commerce_app/provider/auth_provider.dart';
import 'package:e_commerce_app/provider/category_res_provider.dart';
import 'package:e_commerce_app/provider/new_product_provider.dart';
import 'package:e_commerce_app/provider/popular_product_provider.dart';
import 'package:e_commerce_app/provider/product_sub_category_provider.dart';
import 'package:e_commerce_app/provider/splash_provider.dart';
import 'package:e_commerce_app/util/color_resources.dart';
import 'package:e_commerce_app/util/images.dart';
import 'package:e_commerce_app/view/screen/homepage/homepage_screen.dart';
import 'package:e_commerce_app/view/screen/sign_in/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dashboard/dashboard_screen.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
GlobalKey<ScaffoldMessengerState> _globalKey=GlobalKey();
late StreamSubscription<ConnectivityResult> _onConnectivityChange;

  @override
  void initState() {
    super.initState();
    bool _firstTime=true;
    _onConnectivityChange=Connectivity().onConnectivityChanged
    .listen((ConnectivityResult result) {
      if(!_firstTime){
        bool isNotConnected=result!=ConnectivityResult.wifi &&
      result !=ConnectivityResult.mobile;
        isNotConnected? SizedBox()
        :ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: isNotConnected? ColorResources.red:ColorResources.GREEN,
            duration: Duration(seconds: isNotConnected?6000:3),
            content: Text(isNotConnected? "No Connection": "Connected",
            textAlign: TextAlign.center,),));
        if(!isNotConnected){
          _route();
      }
        _firstTime=false;
      }
    });
    _route();
  }

  @override
  void dispose(){
    super.dispose();
    _onConnectivityChange.cancel();
  }

  void _route(){
    Timer(Duration(seconds: 2), () {
      if(Provider.of<AuthProvider>(context, listen: false).getIsLogin()){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen(),));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
    }  Provider.of<SplashProvider>(context, listen: false).initSharedPrefData();
      Provider.of<NewProductProvider>(context, listen: false).getNewProductList();
      Provider.of<PopularProductProvider>(context, listen: false).getPopularProductList();
      Provider.of<AuthProvider>(context, listen: false).CustomerInfo();

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: ColorResources.black,
      body: Center(
        child: Container(
          height: 180,
          width: 187,
          decoration: BoxDecoration(
            border: Border.all(
                color: ColorResources.splashBorder,
            width: 2)
          ),
          child:Image.asset(Images.splashLogo,fit: BoxFit.cover,)
        ),
      ),
    );
  }
}