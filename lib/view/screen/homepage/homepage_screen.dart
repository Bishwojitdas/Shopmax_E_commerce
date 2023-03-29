import 'package:e_commerce_app/data/model/response/new_product_model.dart';
import 'package:e_commerce_app/data/model/response/popular_product_model.dart';
import 'package:e_commerce_app/data/repository/cart_provider.dart';
import 'package:e_commerce_app/provider/new_product_provider.dart';
import 'package:e_commerce_app/provider/popular_product_provider.dart';
import 'package:e_commerce_app/util/color_resources.dart';
import 'package:e_commerce_app/util/custom_themes.dart';
import 'package:e_commerce_app/util/dimensions.dart';
import 'package:e_commerce_app/util/images.dart';
import 'package:e_commerce_app/util/styles.dart';
import 'package:e_commerce_app/view/screen/cart/cart_screen.dart';
import 'package:e_commerce_app/view/screen/product_details/widget/new_product_widget.dart';
import 'package:e_commerce_app/view/screen/product_details/widget/popular_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../search/search_page.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            expandedHeight: 288,
            backgroundColor: ColorResources.black,
            title: Image.asset(Images.splashTitle,width: 216, height: 45,),
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
             title: Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Image.asset(Images.headphone, height: 240, width: 120,),
                 SizedBox(width: 10,),
                 Expanded(child:ListView(
                   physics: NeverScrollableScrollPhysics(),
                   children: [
                   Text("BEATS BY DRE", style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeSmall),),
                     SizedBox(height: 5,),
                     Text("Beats Solo3 Wireless ", style: titilliumBold.copyWith(fontSize: Dimensions.fontSizeOverLarge),),
                     SizedBox(height: 5,),
                     Text("€319.90", style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeSmall),),
                   ],
                 ))
                 
               ],
             ),
              titlePadding: EdgeInsets.only(top: 180),
            ),
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
          SliverToBoxAdapter(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration:const BoxDecoration(
                  color: ColorResources.background,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: Dimensions.paddingSizeExtraExtraSmall),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("New Products", style: titilliumBold.copyWith(color: Colors.black, fontSize: Dimensions.fontSizeOverLarge),),
                        TextButton(onPressed: () {

                        }, child: Text("See All", style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeDefault, color: ColorResources.black),))
                      ],),
                  ),

                  Consumer<NewProductProvider>(builder: (context, newProduct, child) {
                    List<NewProductModel> newProductList;
                    newProductList=newProduct.newProList;
                    return newProductList!=null
                        ?
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: newProduct.newProList!.length,
                        itemBuilder: (context, index) {
                          return NewProductWidget(newProductModel: newProductList[index], index: index);
                        },),
                    )
                        :CircularProgressIndicator();
                  },),

                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall,),
                    child: Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: Dimensions.paddingSizeExtraExtraSmall),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Popular Products", style: titilliumBold.copyWith(color: Colors.black, fontSize: Dimensions.fontSizeOverLarge),),
                        TextButton(onPressed: () {

                        }, child: Text("See All", style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeDefault, color: ColorResources.black),))
                      ],),
                  ),

                  Consumer<PopularProductProvider>(builder: (context, popularProduct, child) {
                    List<PopularProductModel> poProdList;
                    poProdList=popularProduct.poProList;
                    return poProdList!=null?  GridView.builder(
                        itemCount: poProdList!.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 300,
                        ),
                        primary: false,
                        shrinkWrap: true, // --->> Show Page
                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
                            child: PopularProductWidget(popularProductModel: poProdList[index], index: index),
                          );
                        }
                    )
                        :CircularProgressIndicator();
                  },)




                ],
              ),

            ),
          )

        ],
      ),
    );
  }
}


