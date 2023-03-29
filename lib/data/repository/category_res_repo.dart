import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/datasource/remote/dio/dio_client.dart';
import 'package:e_commerce_app/data/model/response/base/category_response.dart';
import 'package:e_commerce_app/util/app_constants.dart';

class CategoryResponseRepo{

  final DioClient dioClient;
  CategoryResponseRepo({required this.dioClient});

  //Products from api

  Future<List<CategoryResponse>> getCategoryProducts()async{
    try{
      Response response=await Dio().get(AppConstants.SHOPMAX_BASE_URL+AppConstants.CATEGORY);
      List<CategoryResponse> newProduct=[];
      for (var item in response.data){
        newProduct.add(CategoryResponse.fromJson(item));
      }
      return newProduct;
    }catch(error, stacktrace){
      print(("Exception occured: $error stackTrace: $stacktrace"));
      return [];
    }
  }

}