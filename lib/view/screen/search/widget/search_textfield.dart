import 'package:flutter/material.dart';

import '../../../../util/color_resources.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(Dimensions.paddingSizeSmall),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: ColorResources.black,width: 1)), focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: ColorResources.black,width: 1)),
        hintText: "Search Categories, Products",
        hintStyle:titilliumRegular.copyWith(color: ColorResources.black) ,
        prefixIcon: Icon(Icons.search, color: ColorResources.black,),
      ),
      autofocus: true,
      style: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeDefault),
    );
  }
}