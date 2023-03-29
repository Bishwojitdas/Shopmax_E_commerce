import 'package:e_commerce_app/util/custom_themes.dart';
import 'package:e_commerce_app/util/styles.dart';
import 'package:flutter/material.dart';

import '../../../util/color_resources.dart';
import '../../../util/dimensions.dart';
import '../../../util/images.dart';
import '../search/search_page.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

var _scaffoldKey=GlobalKey<ScaffoldState>();

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
    body: CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: false,
          pinned: true,
          expandedHeight: 60,
          backgroundColor: ColorResources.black,

          leading:IconButton(onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          }, icon: const Image(image: AssetImage("assets/images/drawer.png"), width: 23, height: 23,),),
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
              child: IconButton(onPressed: () {

              }, icon: Image.asset(Images.cartIcon, height: 22, width: 23,)),
            )
          ],
        ),
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
                        child: Text("Favourite", style: ubuntuBold.copyWith(color: Colors.black, fontSize: Dimensions.fontSizeLarge),),
                      ),

                    ],),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height:MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                      return  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Image.asset(Images.splashLogo, height: 80,width: 70, fit: BoxFit.cover,),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Container(
                                     width: MediaQuery.of(context).size.width/2.5,
                                     child: Text("Sprite Can", style: ubuntuBold.copyWith(
                                       fontSize: Dimensions.fontSizeLarge, color: ColorResources.black
                                     ),),
                                   ),
                                   Container(
                                     width: MediaQuery.of(context).size.width/2.5,
                                     child: Text("350ml, piece", style: ubuntuRegular.copyWith(color: ColorResources.black
                                     ),),
                                   )
                                 ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("\$1.50", style: ubuntuRegular.copyWith(color: ColorResources.black,
                                      overflow: TextOverflow.ellipsis)),
                                  IconButton(onPressed: () {

                                  }, icon: Icon(Icons.arrow_forward_ios))
                                ],
                              ),
                            ],
                          ),

                        ),
                      );
                    },

                    )
                ),




              ],
            ),

          ),
        )
      ],
    ),
      drawer: Drawer(),
    );
  }
}
