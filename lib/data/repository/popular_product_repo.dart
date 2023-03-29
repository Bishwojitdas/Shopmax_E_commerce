import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/datasource/remote/dio/dio_client.dart';
import 'package:e_commerce_app/data/model/response/popular_product_model.dart';
import 'package:e_commerce_app/util/app_constants.dart';

class PopularProductRepo{
  final DioClient dioClient;
  PopularProductRepo({required this.dioClient});

  // Products from api

  Future<List<PopularProductModel>> getPopularProducts() async {
    try {
      Response response = await Dio()
          .get(AppConstants.BASE_URL+AppConstants.PRODUCTLIST);
      List<PopularProductModel> poProducts = [];
      for (var item in response.data) {
        poProducts.add(PopularProductModel.fromJson(item));
      }
      return poProducts;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return [];
    }
  }


}