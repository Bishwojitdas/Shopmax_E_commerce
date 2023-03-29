import 'package:e_commerce_app/data/model/response/base/category_response.dart';
import 'package:e_commerce_app/data/repository/category_res_repo.dart';
import 'package:flutter/cupertino.dart';

class CategoryResponseProvider with ChangeNotifier{
  final CategoryResponseRepo cateRepo;

  CategoryResponseProvider({required this.cateRepo});

  List<CategoryResponse> _cateProList=[];
  List<CategoryResponse> get cateProList=>_cateProList;


  void getNewProductList()async{
    _cateProList.clear();
    _cateProList=await cateRepo.getCategoryProducts();
    print(("Category"));
    print(_cateProList.length);
    print(_cateProList);
    notifyListeners();
  }

}