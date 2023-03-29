import 'package:e_commerce_app/data/repository/product_category_repository.dart';
import 'package:flutter/cupertino.dart';

import '../data/model/response/product_category_model.dart';

class ProductCategoryProvider with ChangeNotifier{
  ProductCategoryRepo productCategoryRepo=ProductCategoryRepo();

  List<ProductCategoryModel> _proCateList=[];
  List<ProductCategoryModel> get proCateList=>_proCateList;


   ProductCategoryListData()async{
    _proCateList=await productCategoryRepo.getProductCategoryModel();
    notifyListeners();
  }


}