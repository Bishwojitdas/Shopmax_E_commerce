import 'package:e_commerce_app/data/model/response/base/api_response.dart';
import 'package:e_commerce_app/data/model/response/new_product_model.dart';
import 'package:e_commerce_app/data/repository/product_details_repo.dart';
import 'package:e_commerce_app/helper/api_checker.dart';
import 'package:flutter/widgets.dart';

class ProductDetailsProvider with ChangeNotifier{

  ProductDetailsRepo productDetailsRepo;

  ProductDetailsProvider({required this.productDetailsRepo});

  int? _imageSliderIndex=1;
  int _quantity = 1;

  int? get imageSliderIndex => _imageSliderIndex;
  int get quantity => _quantity;

  NewProductModel? _newProductModel=null;
  NewProductModel? get newProductModel=>_newProductModel;

  List<int> _productSizeList=[36, 37, 38, 39, 40, 41, 42];
  List<int> get productSizeList=>_productSizeList;

  int _productSizeIndex=-1;
  int get productSizeIndex=>_productSizeIndex;

  void getSingleProduct(String productID, BuildContext context) async{
    ApiResponse apiResponse=await productDetailsRepo.getProduct(productID);
    if(apiResponse.response!=null && apiResponse.response!.statusCode==200){
      _newProductModel=NewProductModel.fromJson(apiResponse.response!.data);
    }else{
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
  }

  void setImageSliderSelectedIndex(int selectedIndex){
    _imageSliderIndex=selectedIndex;
    notifyListeners();
  }
  void setQuantity(int value){
    _quantity=value;
    notifyListeners();
  }

  void setProductSize(int value){
    _productSizeIndex=value;
    notifyListeners();
  }

}
