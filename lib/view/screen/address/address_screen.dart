import 'package:flutter/material.dart';

import '../../../util/color_resources.dart';
import '../../../util/dimensions.dart';
import '../../../util/images.dart';
import '../../../util/styles.dart';
import '../dashboard/dashboard_screen.dart';
import '../search/search_page.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}


var _scaffoldKey=GlobalKey<ScaffoldState>();
var _formkey=GlobalKey<FormState>();

final TextEditingController _streetController=TextEditingController();
final TextEditingController _streetOptionalController=TextEditingController();
final TextEditingController _cityController=TextEditingController();
final TextEditingController _stateController=TextEditingController();
final TextEditingController _phoneController=TextEditingController();

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    var ch=MediaQuery.of(context).size.height;
    var cw=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorResources.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            expandedHeight: 60,
            backgroundColor: ColorResources.black,

            leading:IconButton(onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            }, icon: const Image(image: AssetImage("assets/images/drawer.png"), width: 23, height: 23,),),
            title: Image.asset(Images.splashTitle,width: 216, height: 45,),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: Dimensions.paddingSizeDefault),
                child: IconButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage(),));
                }, icon: Image.asset(Images.searchIcon, height: 22, width: 26,)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                child: IconButton(onPressed: () {

                }, icon: Image.asset(Images.cartIcon, height: 22, width: 23,)),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
                height: ch,
                width: cw,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: IconButton(onPressed: () {

                      },
                          icon: Icon(Icons.close, color: Colors.black, weight: 5, size: 25,)),
                      title: Text("Add Address", style: titilliumBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge,
                          color: ColorResources.black)),
                    ),
                    SizedBox(height: 60,),
                    Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                                  vertical: Dimensions.paddingSizeExtraSmall),
                              child: Text("Street Address", style: titilliumBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge,
                                  color: ColorResources.black)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                                  vertical: Dimensions.paddingSizeExtraSmall),
                              child: Container(
                                height: 50,
                                width: cw,
                                decoration: BoxDecoration(color: ColorResources.white,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(color: Colors.black)
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(color: Colors.black)),
                                  ),
                                  controller: _streetController,
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if(value!.length==null || value.length==0){
                                      return "Street Adress can't be empty";
                                    }
                                  },
                                  style: titilliumRegular.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                                  vertical: Dimensions.paddingSizeExtraSmall),
                              child: Text("Street Address 2 (Optional)", style: titilliumBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge,
                                  color: ColorResources.black)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                                  vertical: Dimensions.paddingSizeExtraSmall),
                              child: Container(
                                height: 50,
                                width: cw,
                                decoration: BoxDecoration(color: ColorResources.white,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                   focusedBorder: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(8),
                                     borderSide: BorderSide(color: Colors.black)
                                   ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(color: Colors.black)),
                                  ),
                                  controller: _streetOptionalController,
                                  keyboardType: TextInputType.text,
                                  style: titilliumRegular.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                                  vertical: Dimensions.paddingSizeExtraSmall),
                              child: Text("City", style: titilliumBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge,
                                  color: ColorResources.black)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                                  vertical: Dimensions.paddingSizeExtraSmall),
                              child: Container(
                                height: 50,
                                width: cw,
                                decoration: BoxDecoration(color: ColorResources.white,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      enabledBorder:  OutlineInputBorder(
                                          borderSide:BorderSide(color: ColorResources.black)
                                      ),
                                      focusedBorder:  OutlineInputBorder(
                                          borderSide: BorderSide(color: ColorResources.black)
                                      )
                                  ),
                                  controller: _cityController,
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if(value!.length==null || value.length==0){
                                      return "city can't be empty";
                                    }
                                  },
                                  style: titilliumRegular.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                                  vertical: Dimensions.paddingSizeExtraSmall),
                              child: Text("State/Province/Region", style: titilliumBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge,
                                  color: ColorResources.black)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                                  vertical: Dimensions.paddingSizeExtraSmall),
                              child: Container(
                                height: 50,
                                width: cw,
                                decoration: BoxDecoration(color: ColorResources.white,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: TextFormField(
                                  decoration:const InputDecoration(
                                      contentPadding:  EdgeInsets.all(Dimensions.paddingSizeDefaultAddress),
                                      enabledBorder:  OutlineInputBorder(
                                          borderSide:BorderSide(color: ColorResources.black)
                                      ),
                                      focusedBorder:  OutlineInputBorder(
                                          borderSide: BorderSide(color: ColorResources.black)
                                      )
                                  ),
                                  controller: _stateController,
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if(value!.length==null || value.length==0){
                                      return "State/Region can't be empty";
                                    }
                                  },
                                  style: titilliumRegular.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                                  vertical: Dimensions.paddingSizeExtraSmall),
                              child: Text("Phone Number", style: titilliumBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge,
                                  color: ColorResources.black)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                                  vertical: Dimensions.paddingSizeExtraSmall),
                              child: Container(
                                height: 50,
                                width: cw,
                                decoration: BoxDecoration(color: ColorResources.white,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: TextFormField(
                                  decoration:const InputDecoration(
                                      contentPadding:  EdgeInsets.all(Dimensions.paddingSizeDefaultAddress),
                                      enabledBorder:  OutlineInputBorder(
                                          borderSide:BorderSide(color: ColorResources.black)
                                      ),
                                      focusedBorder:  OutlineInputBorder(
                                          borderSide: BorderSide(color: ColorResources.black)
                                      )
                                  ),
                                  controller: _phoneController,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if(value!.length==null || value.length==0){
                                      return "Number can't be empty";
                                    } else  if(value!.length<6){
                                      return "Enter Valid Number";
                                    }
                                  },
                                  style: titilliumRegular.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),
                                ),
                              ),
                            ),

                            const SizedBox(height: 100,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                                  vertical: Dimensions.paddingSizeExtraExtraSmall),
                              child: InkWell(onTap: () {
                                if(_formkey.currentState!.validate()){
                                  setState(() {
                                    _streetController.clear();
                                    _streetOptionalController.clear();
                                    _cityController.clear();
                                    _stateController.clear();
                                    _phoneController.clear();
                                  });
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen(),));
                                }
                              },
                                child: Container(
                                  width: cw,
                                  decoration: BoxDecoration(
                                      color: ColorResources.buttonBG,
                                      border: Border.all(color: Colors.blue, width: 1)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                                    child: Text("Add Address", style: titilliumBold.copyWith(color: Colors.white,
                                        fontSize: Dimensions.fontSizeExtraLarge),textAlign: TextAlign.center,),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        )),
                  ],
                )
            )
            ,)
        ],
      ),
    );
  }
}
