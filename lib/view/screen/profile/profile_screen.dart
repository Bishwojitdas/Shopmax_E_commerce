
import 'package:e_commerce_app/data/repository/cart_provider.dart';
import 'package:e_commerce_app/provider/auth_provider.dart';
import 'package:e_commerce_app/util/color_resources.dart';
import 'package:e_commerce_app/util/custom_themes.dart';
import 'package:e_commerce_app/util/dimensions.dart';
import 'package:e_commerce_app/util/images.dart';
import 'package:e_commerce_app/util/styles.dart';
import 'package:e_commerce_app/view/screen/cart/cart_screen.dart';
import 'package:e_commerce_app/view/screen/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AuthProvider>(context, listen: false).CustomerInfo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            backgroundColor: ColorResources.black,
            title: Image.asset(Images.splashTitle,width: 216, height: 45,),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: Dimensions.paddingSizeDefault),
                child: IconButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage(),));
                }, icon: Image.asset(Images.searchIcon, height: 22, width: 26,)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                child: Stack(
                  children: [
                    IconButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => CartScreen(),));
                    },
                        icon: Image.asset(Images.cartIcon, height: 22, width: 23,)),
                    Positioned(
                        top: 4, right:4,
                        child: Consumer<CartProvider>(builder: (context, cart, child) {
                          return CircleAvatar( radius: 7,
                            backgroundColor: ColorResources.RED,
                            child: Text(cart.cartList.length.toString(),
                                style: ubuntuSemiBold.copyWith(
                                    fontSize: Dimensions.fontSizeExtraSmall,
                                    color: ColorResources.WHITE
                                )),
                          );
                        },))
                  ],
                ),
              )
            ],
          ),
        Consumer<AuthProvider>(builder: (context, auth, child) {
          return auth.user!=null?
            SliverToBoxAdapter(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration:const BoxDecoration(
                  color: ColorResources.background,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: Dimensions.paddingSizeExtraExtraSmall),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(onPressed: () {

                        },child:const Icon(Icons.cancel, color: ColorResources.black,
                          size: 30,)),
                        Padding(
                          padding:const  EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("Profile", style: titilliumBold.copyWith(color: Colors.black, fontSize: Dimensions.fontSizeLarge),),
                        ),

                      ],),
                  ),
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(Images.appleWatch, height: 100,
                              width: 100, fit: BoxFit.cover,),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${auth.user!.firstName}", style: ubuntuBold.copyWith(fontSize: Dimensions.fontSizeLarge),),
                            Text("bishwoji88@gmail.com", style: ubuntuRegular,)
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.person),
                            title: Text("Gender", style: ubuntuRegular.copyWith(color: ColorResources.black)),
                            trailing: Container(
                              width: MediaQuery.of(context).size.width/2,
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("Male", style: ubuntuRegular.copyWith(color: ColorResources.black,
                                      overflow: TextOverflow.ellipsis)),
                                  IconButton(onPressed: () {

                                  }, icon: Icon(Icons.arrow_forward_ios))
                                ],
                              ),
                            ),
                          ),
                          ListTile(
                            leading:const Icon(Icons.calendar_month),
                            title: Text("Birthday", style: ubuntuRegular.copyWith(color: ColorResources.black)),
                            trailing: Container(
                              width: MediaQuery.of(context).size.width/2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("10-02-2002", style: ubuntuRegular.copyWith(color: ColorResources.black,
                                      overflow: TextOverflow.ellipsis)),
                                  IconButton(onPressed: () {

                                  }, icon: Icon(Icons.arrow_forward_ios))
                                ],
                              ),
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.mail),
                            title: Text("Email", style: ubuntuRegular.copyWith(color: ColorResources.black)),
                            trailing: Container(
                              width: MediaQuery.of(context).size.width/2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("bishwoji88@gmail.com", style: ubuntuRegular.copyWith(color: ColorResources.black,
                                      overflow: TextOverflow.ellipsis)),
                                  IconButton(onPressed: () {

                                  }, icon: Icon(Icons.arrow_forward_ios))
                                ],
                              ),
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.phone_android_sharp),
                            title: Text("Phone Number", style: ubuntuRegular.copyWith(color: ColorResources.black)),
                            trailing: Container(
                              width: MediaQuery.of(context).size.width/2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("01868690289", style: ubuntuRegular.copyWith(color: ColorResources.black,
                                      overflow: TextOverflow.ellipsis)),
                                  IconButton(onPressed: () {

                                  }, icon: Icon(Icons.arrow_forward_ios))
                                ],
                              ),
                            ),
                          ),
                          ListTile(
                            leading:const Icon(Icons.lock),
                            title: Text("Change Password", style: ubuntuRegular.copyWith(color: ColorResources.black)),
                            trailing: Container(
                              width: MediaQuery.of(context).size.width/2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("...................", style: ubuntuRegular.copyWith(color: ColorResources.black,
                                      overflow: TextOverflow.ellipsis)),
                                  IconButton(onPressed: () {

                                  }, icon: Icon(Icons.arrow_forward_ios))
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                  ),




                ],
              ),

            ),
          ):CircularProgressIndicator();
        },)


        ],
      ),
      // body: ListView(
      //   children: [
      //     Consumer<AuthProvider>(builder: (context, user, child) {
      //       return Container(
      //         height: 500,
      //         width: MediaQuery.of(context).size.width,
      //         child: Padding(
      //           padding: const EdgeInsets.all(15),
      //           child: Column(
      //             children: [
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Text("Gender", style: ubuntuBold.copyWith(fontSize: 18),),
      //                   Text(user.user?.address.toString()??"", style: ubuntuBold.copyWith(fontSize: 18),),
      //                 ],
      //               ),
      //               Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Text("Birthday"),
      //                 ],
      //               ),
      //               Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Text("E-mail"),
      //                 ],
      //               ),
      //               Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Text("Phone Number"),
      //                 ],
      //               ),
      //             ],
      //           ),
      //         ),
      //       );
      //     },),
      //
      //   ],
      // ),
    );
  }
}
