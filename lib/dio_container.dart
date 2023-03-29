import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/datasource/remote/dio/dio_client.dart';
import 'package:e_commerce_app/data/datasource/remote/dio/logging_interceptor.dart';
import 'package:e_commerce_app/data/repository/auth_repo.dart';
import 'package:e_commerce_app/data/repository/brand_repo.dart';
import 'package:e_commerce_app/data/repository/cart_provider.dart';
import 'package:e_commerce_app/data/repository/cart_repo.dart';
import 'package:e_commerce_app/data/repository/category_res_repo.dart';
import 'package:e_commerce_app/data/repository/new_product_repository.dart';
import 'package:e_commerce_app/data/repository/popular_product_repo.dart';
import 'package:e_commerce_app/data/repository/product_category_repository.dart';
import 'package:e_commerce_app/data/repository/product_details_repo.dart';
import 'package:e_commerce_app/data/repository/product_sub_category_repository.dart';
import 'package:e_commerce_app/data/repository/splash_repo.dart';
import 'package:e_commerce_app/helper/network_info.dart';
import 'package:e_commerce_app/provider/auth_provider.dart';
import 'package:e_commerce_app/provider/brand_provider.dart';
import 'package:e_commerce_app/provider/category_res_provider.dart';
import 'package:e_commerce_app/provider/new_product_provider.dart';
import 'package:e_commerce_app/provider/popular_product_provider.dart';
import 'package:e_commerce_app/provider/product_category_provider.dart';
import 'package:e_commerce_app/provider/product_details_provider.dart';
import 'package:e_commerce_app/provider/product_sub_category_provider.dart';
import 'package:e_commerce_app/provider/splash_provider.dart';
import 'package:e_commerce_app/util/app_constants.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl=GetIt.instance;

Future<void> init()async{

  //core
  sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => DioClient(AppConstants.SHOPMAX_BASE_URL, sl(),
      loggingInterceptor: sl(), sharedPreferences: sl()));

  //Repository
  sl.registerLazySingleton(() => NewProductRepo(dioClient: sl()));
  sl.registerLazySingleton(() => ProductCategoryRepo());
  sl.registerLazySingleton(() => ProductSubCategoryRepo());
  sl.registerLazySingleton(() => CategoryResponseRepo(dioClient: sl()));
  sl.registerLazySingleton(() => BrandRepo(dioClient: sl()));
  sl.registerLazySingleton(() => AuthRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => CartRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => ProductDetailsRepo(dioClient: sl()));
  sl.registerLazySingleton(() => SplashRepo(dioClient: sl(),
      sharedPreferences: sl()));
  sl.registerLazySingleton(() => PopularProductRepo(dioClient: sl()));


  //Provider
  sl.registerLazySingleton(() => NewProductProvider(newproRepo: sl()));
  sl.registerLazySingleton(() => ProductCategoryProvider());
  sl.registerLazySingleton(() => SplashProvider(splashRepo: sl()));
  sl.registerLazySingleton(() => AuthProvider(authRepo: sl()));
  sl.registerLazySingleton(() => BrandProvider(brandRepo: sl()));
  sl.registerLazySingleton(() => CartProvider(cartRepo: sl()));
  sl.registerLazySingleton(() => ProductSubCategoryProvider());
  sl.registerLazySingleton(() => CategoryResponseProvider(cateRepo: sl()));
  sl.registerLazySingleton(() => PopularProductProvider(poProRepo: sl()));
  sl.registerLazySingleton(() => ProductDetailsProvider(productDetailsRepo: sl()));

  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
  sl.registerLazySingleton(() => Connectivity());
}