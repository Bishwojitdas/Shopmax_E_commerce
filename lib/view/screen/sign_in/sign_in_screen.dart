import 'package:e_commerce_app/provider/auth_provider.dart';
import 'package:e_commerce_app/util/color_resources.dart';
import 'package:e_commerce_app/util/dimensions.dart';
import 'package:e_commerce_app/util/images.dart';
import 'package:e_commerce_app/view/screen/dashboard/dashboard_screen.dart';
import 'package:e_commerce_app/view/screen/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../util/styles.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

var _formkey=GlobalKey<FormState>();
final TextEditingController _emailController=TextEditingController();
final TextEditingController _passController=TextEditingController();


void _submit(BuildContext context){
  if(_formkey.currentState!.validate()) {
    Provider.of<AuthProvider>(context, listen: false)
        .login(context, _emailController.text.trim(), _passController.text.trim());
  }else{
    _formkey.currentState!.save();
  }
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {

    var ch=MediaQuery.of(context).size.height;
    var cw=MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(image: AssetImage(Images.splashLogo), height: 90, width: 100,),
            Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
              child: RichText(text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: "Welcome to", style: titilliumBold.copyWith(color: Colors.white,
                  fontSize: Dimensions.fontSizeExtraLarge)),
                  TextSpan(text: " SouQ portsaid", style: titilliumBold.copyWith(color: Colors.orange,
                  fontSize: Dimensions.fontSizeExtraLarge)),
                ]

              )),
            ),
            Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeExtraExtraSmall),
              child: Text("Sign In to Continue", style: titilliumRegular.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeLarge),),
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
                            prefixIcon: const Icon(Icons.email, color: ColorResources.black, size: 25,),
                            hintText: "Your Email",
                            hintStyle: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                            color: ColorResources.black),
                            contentPadding: const EdgeInsets.all(Dimensions.paddingSizeDefaultAddress),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none
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
                              prefixIcon: const Icon(Icons.lock, color: ColorResources.black, size: 25,),
                              hintText: "Password",
                              hintStyle: titilliumRegular.copyWith(fontSize: Dimensions.fontSizeLarge,
                                  color: ColorResources.black),
                              contentPadding: const EdgeInsets.all(Dimensions.paddingSizeDefaultAddress),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none
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
                        setState(() {
                          _submit(context);
                          _emailController.clear();
                          _passController.clear();
                        });
                      },
                        child: Container(
                          width: cw,
                          decoration: BoxDecoration(
                            color: ColorResources.buttonBG,
                            border: Border.all(color: Colors.blue, width: 1)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                            child: Text("Sign In", style: titilliumBold.copyWith(color: Colors.white,
                            fontSize: Dimensions.fontSizeExtraLarge),textAlign: TextAlign.center,),
                          ),
                        ),
                      ),
                    ),

                  ],
            )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeExtraExtraSmall),
              child: TextButton(onPressed: () {

              }, child: Text("Forgot Password?", style: titilliumBold.copyWith(fontSize: Dimensions.fontSizeLarge,
                  color: Colors.orange),)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: "Dont you have an account?", style: titilliumRegular.copyWith(color: Colors.blueGrey,
                          fontSize: Dimensions.fontSizeLarge)),
                    ]

                )),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                }, child: Text( "Register", style: titilliumBold.copyWith(color: Colors.orange,
                    fontSize: Dimensions.fontSizeExtraLarge)),)

              ],
            ),
          ],
        ),

      )

    );
  }
}
