import 'package:e_commerce_app/util/dimensions.dart';
import 'package:flutter/material.dart';

import '../../../util/color_resources.dart';
import '../../../util/styles.dart';

class CustomTextButton extends StatelessWidget {
  Function? onTap;
  final String buttonText;
  CustomTextButton({Key? key,  this.onTap, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
       onTap;
      },style: TextButton.styleFrom(padding: EdgeInsets.only(left: -10)),
      child: Text(buttonText,
          style: titilliumRegular.copyWith(
            fontSize: Dimensions.fontSizeDefault,
            color: ColorResources.black,
          )),
    );
  }
}