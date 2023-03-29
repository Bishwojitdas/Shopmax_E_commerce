import 'package:e_commerce_app/data/repository/cart_provider.dart';
import 'package:e_commerce_app/data/repository/new_product_repository.dart';
import 'package:e_commerce_app/provider/auth_provider.dart';
import 'package:e_commerce_app/provider/brand_provider.dart';
import 'package:e_commerce_app/provider/category_res_provider.dart';
import 'package:e_commerce_app/provider/new_product_provider.dart';
import 'package:e_commerce_app/provider/popular_product_provider.dart';
import 'package:e_commerce_app/provider/product_category_provider.dart';
import 'package:e_commerce_app/provider/product_details_provider.dart';
import 'package:e_commerce_app/provider/product_sub_category_provider.dart';
import 'package:e_commerce_app/provider/splash_provider.dart';
import 'package:e_commerce_app/view/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'dio_container.dart' as dio;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dio.init();
  runApp(
MultiProvider(providers: providers,
child: const MyApp(),
)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
      builder: EasyLoading.init(),
    );
  }
}



List<SingleChildWidget>providers=[
  ChangeNotifierProvider(create:(context)=> dio.sl<NewProductProvider>()),
  ChangeNotifierProvider(create:(context)=> dio.sl<PopularProductProvider>()),
  ChangeNotifierProvider(create:(context)=> dio.sl<ProductDetailsProvider>()),
  ChangeNotifierProvider(create:(context)=> dio.sl<SplashProvider>()),
  ChangeNotifierProvider(create:(context)=> dio.sl<CategoryResponseProvider>()),
  ChangeNotifierProvider(create:(context)=> dio.sl<BrandProvider>()),
  ChangeNotifierProvider(create:(context)=> dio.sl<AuthProvider>()),
  ChangeNotifierProvider(create:(context)=> dio.sl<CartProvider>()),
  ChangeNotifierProvider(create:(context)=> dio.sl<ProductSubCategoryProvider>()),
  ChangeNotifierProvider(create:(context)=> dio.sl<ProductCategoryProvider>()),
];
