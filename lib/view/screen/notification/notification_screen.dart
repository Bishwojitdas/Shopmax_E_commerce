
import 'package:e_commerce_app/data/model/response/new_product_model.dart';
import 'package:e_commerce_app/view/screen/address/address_screen.dart';
import 'package:e_commerce_app/view/screen/all_products/all_products_screen.dart';
import 'package:e_commerce_app/view/screen/find_products/brand_products.dart';
import 'package:e_commerce_app/view/screen/order/order_screen.dart';
import 'package:e_commerce_app/view/screen/sign_in/sign_in_screen.dart';
import 'package:e_commerce_app/view/screen/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import '../find_products/find_product_screen.dart';
import '../product_details/product_details_screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

// final NewProductModel newProductModel;
// int index;

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
         Padding(
           padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
           child: ElevatedButton(onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => FindProductScreen(),));
           }, child: Text("Find Products")),
         ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BrandScreen(),));
            }, child: Text("Brands")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AllProductScreen(),));
            }, child: Text("All Products")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
            }, child: Text("Sign In")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
            }, child: Text("Sign Up")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => OrderScreen()));
            }, child: Text("Order")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddressScreen()));
            }, child: Text("Address")),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          //   child: ElevatedButton(onPressed: () {
          //     Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(newProductModel: ,)));
          //   }, child: Text("Product details")),
          // )

        ],
      ),
    );
  }
}
