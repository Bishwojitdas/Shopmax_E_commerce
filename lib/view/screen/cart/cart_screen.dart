import 'package:e_commerce_app/data/model/response/cart_model.dart';
import 'package:e_commerce_app/data/repository/cart_provider.dart';
import 'package:e_commerce_app/util/color_resources.dart';
import 'package:e_commerce_app/util/custom_themes.dart';
import 'package:e_commerce_app/util/dimensions.dart';
import 'package:e_commerce_app/view/basewidget/custom_app_bar.dart';
import 'package:e_commerce_app/view/screen/cart/widget/cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  final bool fromCheckout;
  final int sellerId;
   CartScreen({ this.fromCheckout=false, this.sellerId=1, Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CartProvider>(context, listen: false).getCartData();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<CartProvider>(builder: (context, cart, child) {
      double amount=0.0;
      double shippingAmount=5.0;
      double importCharges=15.0;
      List<CartModel> cartList=[];
      cartList.addAll(cart.cartList);
      for(int i=0; i<cart.cartList.length; i++){
        amount=amount+(cart.cartList[i].newProductModel!.price)*
      cart.cartList[i].quantity;
      }
      return Scaffold(
        body: ListView(
          children: [
            CustomAppBar(title: "Cart"),
            Card(
              child: Container(
              padding:  EdgeInsets.only( bottom: Dimensions.paddingSizeSmall,),
                decoration: BoxDecoration(color: ColorResources.WHITE),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                  itemCount: cartList.length,
                  itemBuilder: (context, i) {
                  return CartWidget(cartModel: cartList[i],
                      index: i,
                      fromCheckout: widget.fromCheckout);
                },),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding:const EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeLarge,
                  vertical: Dimensions.paddingSizeDefault
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius:const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),),
              child: cartList.isNotEmpty?
              Column(
                children: [
                  Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(5),
                     color: ColorResources.white,
                     border: Border.all(color: ColorResources.black,width: 0.6),),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 60,
                            child: TextFormField(
                              style: ubuntuRegular.copyWith(color: ColorResources.black,
                                  fontSize: Dimensions.fontSizeLarge),
                              decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: "Enter Cupon Code",
                                  hintStyle: ubuntuRegular.copyWith(fontSize: Dimensions.fontSizeLarge),
                                  contentPadding: EdgeInsets.all(10)
                              ),

                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/3,
                          height: 60,
                          alignment: Alignment.center,
                          decoration:const BoxDecoration(
                            color: ColorResources.buttonBG,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5))
                          ),
                          child: Text("Apply", style: ubuntuBold.copyWith(fontSize: Dimensions.fontSizeLarge,
                              color: ColorResources.white ),textAlign: TextAlign.center,),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Items: ${cart.cartList.length.toString()}", style: ubuntuRegular.copyWith(
                          fontSize: Dimensions.fontSizeLarge),),
                      Text("\$ ${(amount).toStringAsFixed(2)}",
                        style: ubuntuRegular.copyWith(color:ColorResources.black,
                            fontSize: Dimensions.fontSizeLarge,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                  const   SizedBox(height: 10,),
                  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Shipping: ", style: ubuntuRegular.copyWith(
                          fontSize: Dimensions.fontSizeLarge),),
                      Text("\$ ${(shippingAmount).toStringAsFixed(2)}",
                        style: ubuntuRegular.copyWith(color: ColorResources.black,
                            fontSize: Dimensions.fontSizeLarge,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Import Charges: ", style: ubuntuRegular.copyWith(
                          fontSize: Dimensions.fontSizeLarge),),
                      Text("\$ ${(importCharges).toStringAsFixed(2)}",
                        style: ubuntuRegular.copyWith(color:ColorResources.black,
                            fontSize: Dimensions.fontSizeLarge,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                const  SizedBox(height: 20,),
                  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Price: ", style: ubuntuBold.copyWith(
                          fontSize: Dimensions.fontSizeLarge),),
                      Text("\$ ${(amount+shippingAmount+importCharges).toStringAsFixed(2)}",
                        style: ubuntuBold.copyWith(color: ColorResources.buttonBG,
                            fontSize: Dimensions.fontSizeLarge,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ],
              ):SizedBox(),
            ),
            Container(
              height: 80,
              padding:const EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeLarge,
                  vertical: Dimensions.paddingSizeDefault
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius:const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),),
              child: cartList.isNotEmpty?
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Builder(builder: (context) => InkWell(
                    onTap: () {
                      orderCompleteDialogue(context);
                      Provider.of<CartProvider>(context, listen: false)
                          .removeCheckoutProduct(cartList);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
                      ),
                      child: Center(
                        child: Padding(padding:const EdgeInsets.symmetric(
                            horizontal: Dimensions.paddingSizeExtraLarge,
                            vertical: Dimensions.fontSizeSmall
                        ), child: Text("Checkout", style: ubuntuSemiBold.copyWith(
                            fontSize: Dimensions.fontSizeExtraLarge,
                            color: Theme.of(context).cardColor
                        ),),

                        ),
                      ),
                    ),
                  ),)
                ],
              ):SizedBox(),
            ),
          ],
        ),
      );
    },);


  }
}


orderCompleteDialogue(BuildContext context){
  return showDialog(context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:const Text("Order Complete"),
          content:const Text("Congratulations! Your order has been successfully placed"),
          actions: <Widget>[
            TextButton(onPressed: () {
              Navigator.pop(context);
            }, child:const Text("OK"))
          ],
        );
      },);
}
