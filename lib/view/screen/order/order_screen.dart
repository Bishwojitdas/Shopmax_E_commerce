import 'package:e_commerce_app/util/styles.dart';
import 'package:flutter/material.dart';

import '../../../util/color_resources.dart';
import '../../../util/dimensions.dart';
import '../../../util/images.dart';
import '../search/search_page.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

var _scaffoldKey=GlobalKey<ScaffoldState>();

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    var ch=MediaQuery.of(context).size.height;
    var cw=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorResources.black,
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
              height: ch,
              width: cw,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: IconButton(onPressed: () {

                    },
                        icon: Icon(Icons.close, color: Colors.black, weight: 5, size: 25,)),
                    title: Text("Order", style: titilliumBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge,
                        color: ColorResources.black)),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("LQNSU346JK",style: titilliumBold.copyWith(fontSize: Dimensions.fontSizeLarge, letterSpacing: 1,
                            color: ColorResources.black,)),
                            Text("Order at Lafyuu : August 1, 2017",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                height:2, color: ColorResources.black)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Order Status",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black, height: 2)),
                                Text("Shipping",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black, height: 2))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Items",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black, height: 2)),
                                Text("2 Items purchased",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black, height: 2))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Price",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black, height: 2)),
                                Text("\$299,43",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black, height: 2))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("LQNSU346JK",style: titilliumBold.copyWith(fontSize: Dimensions.fontSizeLarge, letterSpacing: 1,
                              color: ColorResources.black,)),
                            Text("Order at Lafyuu : August 1, 2017",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                height:2, color: ColorResources.black)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Order Status",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black, height: 2)),
                                Text("Shipping",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black, height: 2))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Items",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black, height: 2)),
                                Text("2 Items purchased",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black, height: 2))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Price",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black, height: 2)),
                                Text("\$299,43",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black, height: 2))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("LQNSU346JK",style: titilliumBold.copyWith(fontSize: Dimensions.fontSizeLarge, letterSpacing: 1,
                              color: ColorResources.black,)),
                            Text("Order at Lafyuu : August 1, 2017",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                height:2, color: ColorResources.black)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Order Status",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black, height: 2)),
                                Text("Shipping",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black, height: 2))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Items",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black, height: 2)),
                                Text("2 Items purchased",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black, height: 2))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Price",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black, height: 2)),
                                Text("\$299,43",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black, height: 2))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("LQNSU346JK",style: titilliumBold.copyWith(fontSize: Dimensions.fontSizeLarge, letterSpacing: 1,
                              color: ColorResources.black,)),
                            Text("Order at Lafyuu : August 1, 2017",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                height:2, color: ColorResources.black)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Order Status",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black, height: 2)),
                                Text("Shipping",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black, height: 2))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Items",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black, height: 2)),
                                Text("2 Items purchased",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black, height: 2))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Price",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black, height: 2)),
                                Text("\$299,43",style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                    color: ColorResources.black, height: 2))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            )
            ,)
        ],
      ),
    );
  }
}
