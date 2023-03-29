import 'package:e_commerce_app/util/color_resources.dart';
import 'package:e_commerce_app/util/dimensions.dart';
import 'package:e_commerce_app/view/basewidget/button/custom_text_button.dart';
import 'package:e_commerce_app/view/screen/dashboard/dashboard_screen.dart';
import 'package:e_commerce_app/view/screen/homepage/homepage_screen.dart';
import 'package:e_commerce_app/view/screen/search/widget/search_textfield.dart';
import 'package:flutter/material.dart';

import '../../../util/styles.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

TextEditingController _searchController=TextEditingController();

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 60,
            backgroundColor: Colors.white.withOpacity(0.85),
         title: Text("Search", style: titilliumBold.copyWith(
             fontSize: Dimensions.fontSizeExtraLarge, color: ColorResources.black),),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchTextField(),
                  SizedBox(height: 40,),
                  Text("Popular", style: titilliumBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge),),
                  SizedBox(height: 25,),
                  CustomTextButton(buttonText: "Apple MacBook Pro",),
                  CustomTextButton(buttonText: "Beats3",),
                  CustomTextButton(buttonText: "Apple Watch",),
                  CustomTextButton(buttonText: "Speakers",),
                  CustomTextButton(buttonText: "Harman Cardon",),
                  CustomTextButton(buttonText: "AirPods3",),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


