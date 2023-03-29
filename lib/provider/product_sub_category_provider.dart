import 'package:e_commerce_app/data/repository/product_sub_category_repository.dart';
import 'package:flutter/cupertino.dart';

import '../data/model/response/product_sub_category_model.dart';

class ProductSubCategoryProvider with ChangeNotifier{

 ProductSubCategoryRepo productSubCategoryRepo=ProductSubCategoryRepo();

  List<ProductSubCategoryModel> _prosubcateList=[];
  List<ProductSubCategoryModel> get prosubcateList=>_prosubcateList;

  Future<void>getProsubcategoryListData()async{
    _prosubcateList= (await productSubCategoryRepo.getProductSubCategoryListData())!;
    notifyListeners();
  }

}