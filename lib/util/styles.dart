import 'package:flutter/material.dart';
import 'color_resources.dart';
import 'dimensions.dart';

const titilliumRegular = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.w400,
  fontSize: Dimensions.fontSizeSmall,
);

const titleRegular = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.w500,
  fontSize: Dimensions.fontSizeDefault,

);
const titleHeader = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.w600,
  fontSize: Dimensions.fontSizeLarge,

);
const titilliumSemiBold = TextStyle(
  fontFamily: 'Ubuntu',
  fontSize: Dimensions.fontSizeSmall,
  fontWeight: FontWeight.w600,
);

const titilliumBold = TextStyle(
  fontFamily: 'Ubuntu',
  fontSize: Dimensions.fontSizeDefault,
  fontWeight: FontWeight.w700,
);
const titilliumItalic = TextStyle(
  fontFamily: 'Ubuntu',
  fontSize: Dimensions.fontSizeDefault,
  fontStyle: FontStyle.italic,
);

const robotoRegular = TextStyle(
  fontFamily: 'Ubuntu',
  fontSize: Dimensions.fontSizeDefault,
);

const robotoBold = TextStyle(
  fontFamily: 'Ubuntu',
  fontSize: Dimensions.fontSizeDefault,
  fontWeight: FontWeight.w700,
);


textFieldDecoration(){
  return BoxDecoration(
    color: ColorResources.textBg,
    borderRadius: BorderRadius.circular(30),
  );
}