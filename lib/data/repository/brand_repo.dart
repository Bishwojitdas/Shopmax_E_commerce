import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/datasource/remote/dio/dio_client.dart';
import 'package:e_commerce_app/data/model/response/brand_model.dart';
import 'package:e_commerce_app/util/app_constants.dart';

class BrandRepo{
final DioClient dioClient;

BrandRepo({required this.dioClient});

  Future<List<BrandModel>> getBrands()async{
    try{

      Response response=await Dio().get(AppConstants.SHOPMAX_BASE_URL+AppConstants.BRANDS);
      List<BrandModel> brands=[];
      for(var item in response.data){
        brands.add(BrandModel.fromJson(item));
      }
      return brands;
    }catch(error, stacktrace){
      print(("Exception occured: $error stackTrace: $stacktrace"));
      return [];
    }
  }


}