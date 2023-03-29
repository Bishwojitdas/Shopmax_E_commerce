import 'package:e_commerce_app/data/model/response/new_product_model.dart';
import 'package:e_commerce_app/provider/product_details_provider.dart';
import 'package:e_commerce_app/util/color_resources.dart';
import 'package:e_commerce_app/util/dimensions.dart';
import 'package:e_commerce_app/util/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductImageView extends StatelessWidget {
  final NewProductModel newProductModel;
  int index;
   ProductImageView({
     required this.newProductModel, required this.index,
    super.key,
  });

   final PageController _controller=PageController();
   bool isSelect=false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          child:newProductModel.image!=null?
          Container(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              decoration:const BoxDecoration(
                color: ColorResources.white,
              //  color:index%2==0? ColorResources.CART1_BG:ColorResources.CART2_BG,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40),
                ),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                         child: Padding(
                           padding: const EdgeInsets.all(Dimensions.paddingSizeExtraLarge),
                           child: SizedBox(
                            height: MediaQuery.of(context).size.width,
                            child: newProductModel.image!=null?
                            PageView.builder(
                                controller: _controller,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return FadeInImage.assetNetwork(
                                     // fit: BoxFit.cover,
                                      placeholder: Images.placeholder,
                                      height:MediaQuery.of(context).size.width,
                                      width: MediaQuery.of(context).size.width,
                                      image: '${newProductModel.image}',
                                  imageErrorBuilder:  (context, error, stackTrace) =>
                                      Image.asset(
                                        Images.placeholder,
                                        height: MediaQuery.of(context).size.width,
                                        width: MediaQuery.of(context).size.width,
                                       // fit: BoxFit.cover,
                                      ),
                                  ); },
                              onPageChanged: (index){
                                  Provider.of<ProductDetailsProvider>(context, listen: false)
                                      .setImageSliderSelectedIndex(index);
                              },
                            ):const SizedBox(),
                        ),
                         )),
                    Positioned(
                        bottom:0,
                        right: 0,
                        left: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: _indicators(context),
                            )
                          ]
                        ))


                  ],
                ),
              )):SizedBox(),
        ),
      ],
    );
  }
}

List<Widget>_indicators(BuildContext context){
  List<Widget> indicators=[];
  for(int index=0; index<10; index++){
    indicators.add(
      TabPageSelectorIndicator(
          backgroundColor: index==Provider.of<ProductDetailsProvider>(context, listen: false)
          .imageSliderIndex?ColorResources.BLACK:ColorResources.HINT_TEXT_COLOR,
          borderColor: ColorResources.WHITE,
          size:  index==Provider.of<ProductDetailsProvider>
      (context).imageSliderIndex
          ? 15
          : 10)
    );
  }
  return indicators;
}
