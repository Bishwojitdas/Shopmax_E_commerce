import 'package:e_commerce_app/data/model/body/registration_model.dart';
import 'package:e_commerce_app/provider/auth_provider.dart';
import 'package:e_commerce_app/view/screen/dashboard/dashboard_screen.dart';
import 'package:e_commerce_app/view/screen/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import '../../../util/color_resources.dart';
import '../../../util/dimensions.dart';
import '../../../util/images.dart';
import '../../../util/styles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

var _formkey=GlobalKey<FormState>();

final TextEditingController _firstNameController=TextEditingController();
final TextEditingController _lastNameController=TextEditingController();
final TextEditingController _emailController=TextEditingController();
final TextEditingController _mobileController=TextEditingController();
final TextEditingController _addressController=TextEditingController();
final TextEditingController _postController=TextEditingController();
final TextEditingController _districtController=TextEditingController();
final TextEditingController _passController=TextEditingController();


class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {

    var ch=MediaQuery.of(context).size.height;
    var cw=MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Image(image: AssetImage(Images.splashLogo), height: 90, width: 100,),
                  Padding(
                    padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                    child: RichText(text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(text: "Lets Get Started", style: titilliumBold.copyWith(color: Colors.white,
                              fontSize: Dimensions.fontSizeExtraLarge)),
                        ]

                    )),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.all(Dimensions.paddingSizeExtraExtraSmall),
                    child: Text("Create a new account", style: titilliumRegular.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeLarge),),
                  ),
                  SizedBox(height: 25,),
                  Form(
                      key: _formkey,
                      child: Column(
                        children: [
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
                                    prefixIcon: const Icon(Icons.person, color: ColorResources.black, size: 25,),
                                    hintText: "First Name",
                                    hintStyle: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                        color: ColorResources.black),
                                    contentPadding: const EdgeInsets.all(Dimensions.paddingSizeDefaultAddress),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide:BorderSide(color: ColorResources.black)
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: ColorResources.black)
                                    )
                                ),
                                controller: _firstNameController,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if(value!.length==null || value.length==0){
                                    return "First Name can't be empty";
                                  }
                                },
                                style: titilliumRegular.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
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
                                    prefixIcon: const Icon(Icons.person, color: ColorResources.black, size: 25,),
                                    hintText: "Last Name",
                                    hintStyle: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                        color: ColorResources.black),
                                    contentPadding: const EdgeInsets.all(Dimensions.paddingSizeDefaultAddress),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide:BorderSide(color: ColorResources.black)
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: ColorResources.black)
                                    )
                                ),
                                controller: _lastNameController,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if(value!.length==null || value.length==0){
                                    return "Last Name can't be empty";
                                  }
                                },
                                style: titilliumRegular.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
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
                                    prefixIcon: const Icon(Icons.email, color: ColorResources.black, size: 25,),
                                    hintText: "Your Email",
                                    hintStyle: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                        color: ColorResources.black),
                                    contentPadding: const EdgeInsets.all(Dimensions.paddingSizeDefaultAddress),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide:BorderSide(color: ColorResources.black)
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: ColorResources.black)
                                    )
                                ),
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if(value!.length==null || value.length==0){
                                    return "E-mail can't be empty";
                                  }
                                },
                                style: titilliumRegular.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
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
                                    prefixIcon: const Icon(Icons.person, color: ColorResources.black, size: 25,),
                                    hintText: "Mobile",
                                    hintStyle: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                        color: ColorResources.black),
                                    contentPadding: const EdgeInsets.all(Dimensions.paddingSizeDefaultAddress),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide:BorderSide(color: ColorResources.black)
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: ColorResources.black)
                                    )
                                ),
                                controller: _mobileController,
                                keyboardType: TextInputType.phone,
                                maxLength: 11,
                                validator: (value) {
                                  if(value!.length==null || value.length==0){
                                    return "Mobile can't be empty";
                                  }else if(value!.length<11){
                                    return "Enter valid mobile";
                                  }
                                },
                                style: titilliumRegular.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
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
                                    prefixIcon: const Icon(Icons.person, color: ColorResources.black, size: 25,),
                                    hintText: "Address",
                                    hintStyle: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                        color: ColorResources.black),
                                    contentPadding: const EdgeInsets.all(Dimensions.paddingSizeDefaultAddress),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide:BorderSide(color: ColorResources.black)
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: ColorResources.black)
                                    )
                                ),
                                controller: _addressController,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if(value!.length==null || value.length==0){
                                    return "Address can't be empty";
                                  }
                                },
                                style: titilliumRegular.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                          //       vertical: Dimensions.paddingSizeExtraSmall),
                          //   child: Container(
                          //     height: 50,
                          //     width: cw,
                          //     decoration: BoxDecoration(color: ColorResources.white,
                          //         borderRadius: BorderRadius.circular(8)
                          //     ),
                          //     child: TextFormField(
                          //       decoration: InputDecoration(
                          //           prefixIcon: const Icon(Icons.person, color: ColorResources.black, size: 25,),
                          //           hintText: "Post Code",
                          //           hintStyle: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                          //               color: ColorResources.black),
                          //           contentPadding: const EdgeInsets.all(Dimensions.paddingSizeDefaultAddress),
                          //           enabledBorder: const OutlineInputBorder(
                          //               borderSide:BorderSide(color: ColorResources.black)
                          //           ),
                          //           focusedBorder: const OutlineInputBorder(
                          //               borderSide: BorderSide(color: ColorResources.black)
                          //           )
                          //       ),
                          //       controller: _postController,
                          //       maxLength: 4,
                          //       keyboardType: TextInputType.number,
                          //       validator: (value) {
                          //         if(value!.length==null || value.length==0){
                          //           return "Post Code can't be empty";
                          //         } else if(value!.length>4){
                          //           return "Post Code must be 4 characters";
                          //         }
                          //       },
                          //       style: titilliumRegular.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),
                          //     ),
                          //   ),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                          //       vertical: Dimensions.paddingSizeExtraSmall),
                          //   child: Container(
                          //     height: 50,
                          //     width: cw,
                          //     decoration: BoxDecoration(color: ColorResources.white,
                          //         borderRadius: BorderRadius.circular(8)
                          //     ),
                          //     child: TextFormField(
                          //       decoration: InputDecoration(
                          //           prefixIcon: const Icon(Icons.person, color: ColorResources.black, size: 25,),
                          //           hintText: "District Id",
                          //           hintStyle: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                          //               color: ColorResources.black),
                          //           contentPadding: const EdgeInsets.all(Dimensions.paddingSizeDefaultAddress),
                          //           enabledBorder:InputBorder.none,
                          //           // const OutlineInputBorder(
                          //           //     borderSide:BorderSide(color: ColorResources.black)
                          //           // ),
                          //           focusedBorder: InputBorder.none
                          //
                          //           // const OutlineInputBorder(
                          //           //     borderSide: BorderSide(color: ColorResources.black)
                          //           // )
                          //       ),
                          //       controller: _districtController,
                          //       maxLength: 2,
                          //       keyboardType: TextInputType.number,
                          //       validator: (value) {
                          //         if(value!.length==null || value.length==0){
                          //           return "District ID can't be empty";
                          //         } else if(value!.length>2 && value!.length<1){
                          //           return "District ID must be 2 characters";
                          //         }
                          //       },
                          //       style: titilliumRegular.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),
                          //     ),
                          //   ),
                          // ),
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
                                    prefixIcon: const Icon(Icons.lock, color: ColorResources.black, size: 25,),
                                    hintText: "Password",
                                    hintStyle: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                        color: ColorResources.black),
                                    contentPadding: const EdgeInsets.all(Dimensions.paddingSizeDefaultAddress),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide:BorderSide(color: ColorResources.black)
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: ColorResources.black)
                                    )
                                ),
                                controller: _passController,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if(value!.length==null || value.length==0){
                                    return "Password can't be empty";
                                  } else if(value!.length<6){
                                    return "Password must be 6 characters";
                                  }
                                },
                                style: titilliumRegular.copyWith(color: ColorResources.black, fontSize: Dimensions.fontSizeLarge),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge,
                                vertical: Dimensions.paddingSizeExtraExtraSmall),
                            child: InkWell(onTap: () {
                              if(_formkey.currentState!.validate()){
                                RegistrationModel reg= RegistrationModel(firstName: _firstNameController.text.trim(),
                                    lastName: _lastNameController.text.trim(), email:  _emailController.text.trim(),
                                    mobile:  _mobileController.text.trim(), address:  _addressController.text.trim(),
                                    postCode:  int.parse(_postController.text.trim()),
                                    districtId:  int.parse(_districtController.text.trim()),
                                    password: _passController.text.trim());
                                Provider.of<AuthProvider>(context, listen: false).register(reg);
                                setState(() {
                                  _firstNameController.clear();
                                  _lastNameController.clear();
                                  _emailController.clear();
                                  _mobileController.clear();
                                  _addressController.clear();
                                  // _postController.clear();
                                  // _districtController.clear();
                                  _passController.clear();
                                });
                               // Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen(),));
                              }
                              else{
                                EasyLoading.showError("Not Valid");
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
                                  child: Text("Sign Up", style: titilliumBold.copyWith(color: Colors.white,
                                      fontSize: Dimensions.fontSizeExtraLarge),textAlign: TextAlign.center,),
                                ),
                              ),
                            ),
                          ),

                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: "Have an account?", style: titilliumRegular.copyWith(color: Colors.blueGrey,
                                fontSize: Dimensions.fontSizeLarge)),
                          ]

                      )),
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
                      }, child: Text( "Sign In", style: titilliumBold.copyWith(color: Colors.orange,
                          fontSize: Dimensions.fontSizeExtraLarge)),)

                    ],
                  ),
                ],
              ),

            ),
          ],
        )

    );
  }
}
