import 'package:e_commerce_app/provider/category_res_provider.dart';
import 'package:e_commerce_app/provider/product_category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../util/color_resources.dart';
import '../../../util/dimensions.dart';
import '../../../util/images.dart';
import '../../../util/styles.dart';
import '../search/search_page.dart';


class FindProductScreen extends StatefulWidget {
  const FindProductScreen({Key? key}) : super(key: key);

  @override
  State<FindProductScreen> createState() => _FindProductScreenState();
}

class _FindProductScreenState extends State<FindProductScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final ProductCategory=Provider.of<CategoryResponseProvider>(context, listen: false);
    ProductCategory.getNewProductList();
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

              width: MediaQuery.of(context).size.width,
              decoration:const BoxDecoration(
                  color: ColorResources.black,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))
              ),
              child: Column(
                children: [
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: Dimensions.paddingSizeExtraExtraSmall),
                    child:
                        Text("Find Products", style: titilliumBold.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeOverLarge),),
                  ),

                  Consumer<CategoryResponseProvider>(builder: (context, category, child) {
                    return category.cateProList!=null?  GridView.builder(
                        itemCount: category.cateProList!.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          mainAxisExtent: 200,
                        ),
                        primary: false,
                        shrinkWrap: true, // --->> Show Page
                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: ColorResources.productBG,
                                border: Border.all(color: Colors.green, width: 0.8)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(Images.appleWatch, height: 130, width: 130,),
                                  Text("${category.cateProList![index].typeName}", style: titilliumBold.copyWith(
                                    fontSize: Dimensions.fontSizeExtraLarge, color: ColorResources.black
                                  ), textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          );
                        }
                    )
                        :CircularProgressIndicator();
                  },),
                  SizedBox(height: 20,)





                ],
              ),

            ),
          )
        ],
      ),
    );
  }
}
