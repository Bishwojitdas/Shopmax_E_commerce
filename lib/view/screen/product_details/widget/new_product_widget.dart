import 'package:e_commerce_app/data/model/response/new_product_model.dart';
import 'package:e_commerce_app/util/color_resources.dart';
import 'package:e_commerce_app/util/dimensions.dart';
import 'package:e_commerce_app/util/styles.dart';
import 'package:e_commerce_app/view/screen/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';

class NewProductWidget extends StatelessWidget {
  final NewProductModel newProductModel;
  int index;
  NewProductWidget({
    required this.newProductModel,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 1000),
            pageBuilder: (context, animation, secondaryAnimation)
            =>  ProductDetailsScreen(newProduct: newProductModel,index: index, )));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 180,
          child: Column(
            children: [
              Container(
                height: 200,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorResources.white,),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        // Padding(
                        //     padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                        //     child: Container(
                        //         decoration: BoxDecoration(
                        //             color: Colors.yellow,
                        //             borderRadius: BorderRadius.circular(5)
                        //         ), child: Padding(
                        //           padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                        //           child: Text("${popularProduct.poProList![index].category}%", style: titilliumBold.copyWith(
                        //               color: Colors.black
                        //           ),),
                        //         ))
                        // ),
                        Padding(
                          padding: EdgeInsets.only(top: Dimensions.paddingSizeDefault,right: Dimensions.paddingSizeDefault),
                          child: Icon(Icons.favorite_border),
                        ),
                      ],
                    ),
                    Image.network(newProductModel.image, height: 140, width: 150,),
                  ],
                ),
              ),
              const SizedBox(height: 5,),
              Text(newProductModel.title,style: titilliumRegular.copyWith
                (fontSize: Dimensions.fontSizeLarge,color: ColorResources.black, overflow: TextOverflow.ellipsis, ),
                textAlign: TextAlign.center,),
              const SizedBox(height: 5,),
              Text(newProductModel.price.toString(),style: titilliumBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge),),

            ],
          ),
        ),
      ),
    );
  }
}