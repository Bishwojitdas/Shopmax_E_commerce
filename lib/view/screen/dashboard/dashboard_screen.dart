import 'package:e_commerce_app/provider/auth_provider.dart';
import 'package:e_commerce_app/util/dimensions.dart';
import 'package:e_commerce_app/view/screen/favourite/favourite_screen.dart';
import 'package:e_commerce_app/view/screen/homepage/homepage_screen.dart';
import 'package:e_commerce_app/view/screen/notification/notification_screen.dart';
import 'package:e_commerce_app/view/screen/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AuthProvider>(context, listen: false).CustomerInfo();
  }


  int currentIndex=0;
  final List<Widget> screens=[
    HomePageScreen(),
    NotificationScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];

  final PageStorageBucket bucket=PageStorageBucket();
  Widget currentScreen=HomePageScreen();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
          bucket: bucket,
          child: currentScreen),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {

      },
      child:Icon(Icons.dashboard,size: 20, color: Colors.white, ),),floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(

        notchMargin: 10,
        child: Container(
          height:70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget> [
              Padding(
                padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen=HomePageScreen();
                        currentIndex=0;
                      });
                    }, child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home, color: currentIndex==0? Colors.black:Colors.grey,)
                  ],
                ),


                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen=NotificationScreen();
                      currentIndex=1;
                    });
                  }, child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.notifications, color: currentIndex==1? Colors.black:Colors.grey,)
                  ],
                ),


                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen=FavouriteScreen();
                      currentIndex=2;
                    });
                  }, child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite, color: currentIndex==2? Colors.black:Colors.grey,)
                  ],
                ),


                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen=ProfileScreen();
                      currentIndex=3;
                    });
                  }, child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person, color: currentIndex==3? Colors.black:Colors.grey,)
                  ],
                ),


                ),
              )
            ],
          ),
        ),
      ),
      
    );
  }
}
