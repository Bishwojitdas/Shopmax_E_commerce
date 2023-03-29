import 'package:e_commerce_app/provider/product_category_provider.dart';
import 'package:e_commerce_app/provider/product_sub_category_provider.dart';
import 'package:e_commerce_app/util/color_resources.dart';
import 'package:e_commerce_app/util/dimensions.dart';
import 'package:e_commerce_app/util/images.dart';
import 'package:e_commerce_app/util/styles.dart';
import 'package:e_commerce_app/view/screen/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AllProductScreen extends StatefulWidget {
  const AllProductScreen({Key? key}) : super(key: key);

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}


class _AllProductScreenState extends State<AllProductScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProductSubCategoryProvider>(context, listen: false).getProsubcategoryListData();
  }

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
        width: cw,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
          topRight: Radius.circular(20))
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraExtraSmall),
              child: Column(
                children: [
                  const   Padding(
                    padding:  EdgeInsets.all(Dimensions.paddingSizeSmall),
                    child: Image(image: AssetImage("assets/images/fashion.png",),width: 89,),
                  ),
                  Text("Fashion",style: titilliumBold.copyWith(fontSize: Dimensions.fontSizeLarge,
                      color: Colors.deepOrange, shadows:const [
                        Shadow(color: ColorResources.black, blurRadius: 1, offset: Offset(1, 1))
                      ]),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
              child: Container(width: 5,
              height: ch+500,
              decoration: BoxDecoration(
                color: Colors.grey
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric( vertical: Dimensions.paddingSizeSmall),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 Container(
                   height: 60,
                   width: cw*0.5,
                   color: Colors.white,
                   child: ListTile(
                     title: Text("ALL PRODUCTS", style: titilliumBold.copyWith(color: Colors.deepOrange,
                     fontSize: Dimensions.fontSizeLarge), textAlign: TextAlign.center, ),
                     trailing: Icon(Icons.arrow_forward_ios),
                   ),
                 ),
                  Container(
                    height: 8,
                    width: cw*.7,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall,
                        vertical: Dimensions.fontSizeExtraSmall),
                    child: Text("Man Fashion", style: titilliumBold.copyWith(fontSize: Dimensions.fontSizeLarge,
                    color: ColorResources.black),),
                  ),
                  Consumer<ProductSubCategoryProvider>(builder: (context, subCategory, child) {
                    return subCategory.prosubcateList!=null?
                    SizedBox(
                      width: cw*0.7,
                      child: GridView.builder(
                          itemCount: subCategory.prosubcateList!.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 5,
                            childAspectRatio: 3/4.3,
                          ),
                          primary: false,
                          shrinkWrap: true, // --->> Show Page
                          itemBuilder: (BuildContext context, int index){
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      decoration:const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: ClipRRect(
                                          child: Padding(
                                            padding: const EdgeInsets.all(13),
                                            child: Image.asset("${subCategory.prosubcateList![index].subCategoryImage}",
                                            height: 50,width: 50,
                                            ),
                                          ))

                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text("${subCategory.prosubcateList![index].subCategoryName}", style: titilliumRegular.copyWith(
                                        color: ColorResources.black ), textAlign: TextAlign.center,),
                                  )
                                ],
                              ),
                            );
                          }
                      ),
                    )
                        :CircularProgressIndicator();
                  },),
                  SizedBox(height: 15,),
                  Container(
                    height: 8,
                    width: cw*.7,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall,
                     vertical: Dimensions.paddingSizeExtraSmall  ),
                    child: Text("Woman Fashion", style: titilliumBold.copyWith(fontSize: Dimensions.fontSizeLarge,
                        color: ColorResources.black),),
                  ),
                  Consumer<ProductSubCategoryProvider>(builder: (context, subCategory, child) {
                    return subCategory.prosubcateList!=null?
                    Container(
                      width: cw*0.7,
                      child: GridView.builder(
                          itemCount: subCategory.prosubcateList!.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 5,
                            childAspectRatio: 3/4.3,
                          ),
                          primary: false,
                          shrinkWrap: true, // --->> Show Page
                          itemBuilder: (BuildContext context, int index){
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      decoration:const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: ClipRRect(
                                          child: Padding(
                                            padding: const EdgeInsets.all(13),
                                            child: Image.asset("${subCategory.prosubcateList![index].subCategoryImage}",
                                              height: 50,width: 50,
                                            ),
                                          ))

                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text("${subCategory.prosubcateList![index].subCategoryName}", style: titilliumRegular.copyWith(
                                        color: ColorResources.black ), textAlign: TextAlign.center,),
                                  )
                                ],
                              ),
                            );
                          }
                      ),
                    )
                        :CircularProgressIndicator();
                  },),
                  SizedBox(height: 15,),


                ],
              ),
            ),

          ],
        ),
      )
      ,)
  ],
),
    );
  }
}
