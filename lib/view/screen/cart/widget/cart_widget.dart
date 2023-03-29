
import 'package:e_commerce_app/data/model/response/cart_model.dart';
import 'package:e_commerce_app/data/repository/cart_provider.dart';
import 'package:e_commerce_app/util/color_resources.dart';
import 'package:e_commerce_app/util/custom_themes.dart';
import 'package:e_commerce_app/util/dimensions.dart';
import 'package:e_commerce_app/util/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartWidget extends StatelessWidget {
  final CartModel cartModel;
  final int index;
  final bool fromCheckout;

   CartWidget({required this.cartModel,
    required this.index,
    required this.fromCheckout,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Dimensions.paddingSizeSmall),
      padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
      decoration: BoxDecoration(
        color: ColorResources.WHITE,
        borderRadius: BorderRadius.circular(10),
        boxShadow:[
          BoxShadow(
            color: ColorResources.BLACK.withOpacity(0.3),
            spreadRadius: 1, blurRadius: 3
          )
        ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding:const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: ColorResources.WHITE,
              borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
              boxShadow: [
                BoxShadow(
                  color: ColorResources.BLACK.withOpacity(0.3),
                  spreadRadius: 1, blurRadius: 3
                )]),
            child:ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
              child: FadeInImage.assetNetwork(
                  placeholder: Images.placeholder,
                  height: 65, width: 65,
                  image: '${cartModel.newProductModel!.image}',
                  imageErrorBuilder: (c, o  , s) =>Image.asset (
                    Images.placeholder,
                    fit: BoxFit.cover,
                    height: 60, width: 60,
                  ) ,),) ,
          ),
          Expanded(
              child: Padding(
                padding:const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(cartModel.newProductModel!.title,
                            maxLines: 1, overflow: TextOverflow.ellipsis,
                            style: ubuntuSemiBold.copyWith(
                              fontSize: Dimensions.fontSizeDefault,
                              color: ColorResources.REVIEW_RATING
                            ),)),
                      const  SizedBox(width: Dimensions.paddingSizeExtraSmall,),
                        !fromCheckout?
                            InkWell(
                              onTap: () {
                                Provider.of<CartProvider >(context, listen: false)
                                    .removeFromCart(index);
                              },
                              child: Container(
                                width: 20, height: 20,
                                child: Image.asset(Images.delete,
                                  scale: .5,),
                              ),
                            ):SizedBox.shrink(),

                      ],
                    ),
                    const   SizedBox(height: Dimensions.paddingSizeExtraSmall,),
                    Row(
                      children: [
                        Text("\$${cartModel.newProductModel!.price}",
                          maxLines: 1, overflow: TextOverflow.ellipsis,
                          style: ubuntuSemiBold.copyWith(
                              color: ColorResources.RED,
                              decoration: TextDecoration.lineThrough
                          ),),
                        const SizedBox(width: Dimensions.fontSizeDefault,),
                        Text("\$${cartModel.newProductModel!.price}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: ubuntuSemiBold.copyWith(
                              color: ColorResources.COLOR_PRIMARY,
                              fontSize: Dimensions.fontSizeLarge
                          ),)
                      ],
                    ),
                    const  SizedBox(width: Dimensions.paddingSizeSmall,),
                    Row(
                      children: [
                        Expanded(child: Text(
                          cartModel.newProductModel!.category,
                          style: ubuntuRegular.copyWith(
                            overflow: TextOverflow.ellipsis, ),)),
                         Padding(
                          padding:const EdgeInsets.only(
                            right:  Dimensions.paddingSizeSmall ),
                        child: QuantityButton(
                            isIncrement: false,
                            quantity: cartModel.quantity,
                            index: index,
                            maxQty: 20,
                            cartModel: cartModel),
                        ),
                        Text(cartModel.quantity.toString(), style:ubuntuBold ,),
                        Padding(
                          padding:const EdgeInsets.only(
                              left:  Dimensions.paddingSizeSmall ),
                          child: QuantityButton(
                              isIncrement: true,
                              quantity: cartModel.quantity,
                              index: index,
                              maxQty: 20,
                              cartModel: cartModel),
                        ),

                      ],
                    )

                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}

class QuantityButton extends StatelessWidget {
  final CartModel cartModel;
  final bool isIncrement;
  final int quantity;
  final int index;
  final int maxQty;
   QuantityButton({
    required this.isIncrement,
    required this.quantity,
    required this.index,
    required this.maxQty,
    required this.cartModel,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(!isIncrement && quantity>1){
          Provider.of<CartProvider>(context, listen: false)
          .setQuantity(false, index);
        }else if(isIncrement && quantity<maxQty){
          Provider.of<CartProvider>(context, listen: false)
              .setQuantity(true, index);
        }
      },child: Icon(
      isIncrement? Icons.add_circle:Icons.remove_circle,
      color: isIncrement? quantity>=maxQty?
      ColorResources.GREY:ColorResources.COLOR_PRIMARY
      : quantity>1?ColorResources.COLOR_PRIMARY
      : ColorResources.GREY,
      size: 30,

    ),
    );
  }
}



