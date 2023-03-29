import 'package:e_commerce_app/data/datasource/remote/dio/dio_client.dart';
import 'package:e_commerce_app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:e_commerce_app/data/model/response/base/api_response.dart';
import 'package:e_commerce_app/util/app_constants.dart';

class ProductDetailsRepo{
  final DioClient dioClient;

  ProductDetailsRepo({required this.dioClient});

  Future<ApiResponse> getProduct(String productID)async{
    try{
      final response=await dioClient.get(AppConstants.BASE_URL+AppConstants.PRODUCTLIST+"/"+productID);
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));

    }

  }
}