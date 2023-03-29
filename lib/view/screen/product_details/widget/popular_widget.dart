import 'package:e_commerce_app/data/model/response/popular_product_model.dart';
import 'package:e_commerce_app/util/color_resources.dart';
import 'package:e_commerce_app/util/dimensions.dart';
import 'package:e_commerce_app/util/styles.dart';
import 'package:flutter/material.dart';

class PopularProductWidget extends StatelessWidget {
  final PopularProductModel popularProductModel;
  int index;
   PopularProductWidget({
    required this.popularProductModel,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
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
                  Image.network(popularProductModel.image, height: 140, width: 150,),
                ],
              ),
            ),
            const SizedBox(height: 5,),
            Text(popularProductModel.title,style: titilliumRegular.copyWith
              (fontSize: Dimensions.fontSizeLarge,color: ColorResources.black, overflow: TextOverflow.ellipsis, ),
              textAlign: TextAlign.center,),
            const SizedBox(height: 5,),
            Text(popularProductModel.price.toString(),style: titilliumBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge),),

          ],
        ),
      ),
    );
  }
}