
import 'package:e_commerce_app/util/custom_themes.dart';
import 'package:e_commerce_app/util/dimensions.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final isBackButtonExist;
  final IconData? icon;
  final Function? onActionPressed;
  final Function? onBackPressed;

  CustomAppBar(
      {required this.title,
      this.isBackButtonExist = true,
      this.icon,
      this.onActionPressed,
      this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      /* ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
        child: Image.asset(
          Images.toolbar_background, fit: BoxFit.fill,
          height: 50+MediaQuery.of(context).padding.top, width: MediaQuery.of(context).size.width,
          color:  Colors.black ,
        ),
      ),*/
      Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        height: 50,
        alignment: Alignment.center,
        child: Row(children: [
          isBackButtonExist
              ? IconButton(
                  icon:
                      Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
                  onPressed: () => onBackPressed != null
                      ? onBackPressed!()
                      : Navigator.of(context).pop(),
                )
              : SizedBox.shrink(),
          SizedBox(width: Dimensions.paddingSizeSmall),
          Expanded(
            child: Text(
              title,
              style: ubuntuRegular.copyWith(
                fontSize: 20,
                color: Colors.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          icon != null
              ? IconButton(
                  icon: Icon(icon,
                      size: Dimensions.fontSizeLarge, color: Colors.white),
                  onPressed: () => onActionPressed,
                )
              : SizedBox.shrink(),
        ]),
      ),
    ]);
  }
}
