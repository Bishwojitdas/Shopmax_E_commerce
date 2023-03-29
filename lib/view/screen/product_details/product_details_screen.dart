import 'package:e_commerce_app/data/model/response/cart_model.dart';
import 'package:e_commerce_app/data/model/response/new_product_model.dart';
import 'package:e_commerce_app/data/model/response/popular_product_model.dart';
import 'package:e_commerce_app/data/repository/cart_provider.dart';
import 'package:e_commerce_app/provider/new_product_provider.dart';
import 'package:e_commerce_app/provider/popular_product_provider.dart';
import 'package:e_commerce_app/provider/product_details_provider.dart';
import 'package:e_commerce_app/util/color_resources.dart';
import 'package:e_commerce_app/util/custom_themes.dart';
import 'package:e_commerce_app/util/dimensions.dart';
import 'package:e_commerce_app/util/images.dart';
import 'package:e_commerce_app/util/no_internet_conection.dart';
import 'package:e_commerce_app/util/styles.dart';
import 'package:e_commerce_app/view/screen/cart/cart_screen.dart';
import 'package:e_commerce_app/view/screen/product_details/widget/new_product_widget.dart';
import 'package:e_commerce_app/view/screen/product_details/widget/popular_widget.dart';
import 'package:e_commerce_app/view/screen/product_details/widget/product_image_view.dart';
import 'package:e_commerce_app/view/screen/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final NewProductModel newProduct;
  int index;
   ProductDetailsScreen({required this.newProduct, required this.index, Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    return widget.newProduct!=null?
    Scaffold(
      backgroundColor: ColorResources.black,
      body: CustomScrollView(
        physics:const BouncingScrollPhysics(),
        slivers: [
           SliverAppBar(
            backgroundColor: ColorResources.black,
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
              height: MediaQuery.of(context).size.height,
              decoration:const BoxDecoration(
                color: ColorResources.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50),
                ),),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 widget.newProduct!=null?
                     ProductImageView(newProductModel: widget.newProduct, index: widget.index):const SizedBox(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(widget.newProduct.title, style: ubuntuSemiBold.copyWith(fontSize: 18 ), )),
                          const SizedBox(height: 10,),
                          Text("\$ ${widget.newProduct.price}",
                            style: ubuntuBold.copyWith(fontSize: 20, color: Colors.orange), ),
                        ],
                      ),
                    ),
                  ),
                 const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child:  Text("Select Size", style: ubuntuRegular ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Consumer<ProductDetailsProvider>(builder:
                        (context, productDetails, child) {
                      return productDetails.productSizeList!=null?
                          ListView.builder(
                            itemCount:productDetails.productSizeList.length ,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ( context, index) {
                            return InkWell(
                              onTap: () {
                                productDetails.setProductSize(index);
                              },
                              child: Container(
                                height: 40,
                                width: 50,
                                margin:const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: productDetails.productSizeIndex==index ?
                                    Colors.orange : ColorResources.WHITE,
                                    border: Border.all(
                                        width: 1,
                                        color: ColorResources.HINT_TEXT_COLOR
                                    ),
                                    borderRadius:const BorderRadius.all(Radius.circular(10))
                                ),
                                alignment: Alignment.center,
                                child: Text(productDetails.productSizeList[index].toString(),
                                  style: ubuntuRegular.copyWith(color: productDetails.productSizeIndex==index ?   ColorResources.WHITE: ColorResources.BLACK),),
                              ),
                            );
                          },):const SizedBox();
                    },),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Description", style: ubuntuBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge),),
                      const  SizedBox(height: 10,),
                        Text(widget.newProduct.category, style: ubuntuRegular.copyWith(fontSize: 16) ),
                        const SizedBox(height: 8,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                            child: Text("${widget.newProduct.description}", style: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeLarge),)),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            CartModel cart=CartModel(widget.newProduct, 1);
                            Provider.of<CartProvider>(context, listen: false).addToCart(cart);
                            ScaffoldMessenger.of(context).showSnackBar(snackBar("Add to cart successful!"));
                          },child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width/1.8,
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: ColorResources.black)
                          ),
                          child: Text("Add to Cart", style: ubuntuBold.copyWith(fontSize: 24,
                          color: ColorResources.WHITE), textAlign: TextAlign.center,),
                        ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
          )
        ],
      ),
    ): Scaffold(body: NoInternetOrDataScreen(isNoInternet: true, child: ProductDetailsScreen(newProduct: widget.newProduct, index: widget.index)));
  }
}

