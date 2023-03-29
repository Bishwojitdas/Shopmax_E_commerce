import 'package:e_commerce_app/util/color_resources.dart';
import 'package:e_commerce_app/util/dimensions.dart';
import 'package:flutter/material.dart';

const ubuntuRegular = TextStyle(
  fontFamily: 'Ubuntu',
  fontSize: Dimensions.fontSizeDefault,
);

const ubuntuHeader = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.w600,
  fontSize: Dimensions.fontSizeDefault,

);
const ubuntuSemiBold = TextStyle(
  fontFamily: 'Ubuntu',
  fontSize: Dimensions.fontSizeDefault,
  fontWeight: FontWeight.w600,
);

const ubuntuBold = TextStyle(
  fontFamily: 'Ubuntu',
  fontSize: Dimensions.fontSizeDefault,
  fontWeight: FontWeight.w700,
);
const ubuntuItalic = TextStyle(
  fontFamily: 'Ubuntu',
  fontSize: Dimensions.fontSizeDefault,
  fontStyle: FontStyle.italic,
);

snackBar (String msg){
  return  SnackBar(
    content:  Text(msg,style: ubuntuRegular.copyWith(color: ColorResources.WHITE),),
    backgroundColor: ColorResources.COLOR_PRIMARY,
  );
}

