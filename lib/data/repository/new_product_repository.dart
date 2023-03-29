import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/datasource/remote/dio/dio_client.dart';
import 'package:e_commerce_app/util/app_constants.dart';
import 'package:e_commerce_app/util/images.dart';
import 'package:e_commerce_app/data/model/response/new_product_model.dart';
class NewProductRepo{

  final DioClient dioClient;
  NewProductRepo({required this.dioClient});

  //Products from api

Future<List<NewProductModel>> getProducts()async{
  try{
    Response response=await Dio().get(AppConstants.BASE_URL+AppConstants.PRODUCTLIST);
    List<NewProductModel> newProduct=[];
    for (var item in response.data){
      newProduct.add(NewProductModel.fromJson(item));
    }
    return newProduct;
  }catch(error, stacktrace){
    print(("Exception occured: $error stackTrace: $stacktrace"));
    return [];
  }
}

}