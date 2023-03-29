import 'package:e_commerce_app/data/repository/new_product_repository.dart';
import 'package:e_commerce_app/provider/product_category_provider.dart';
import 'package:flutter/cupertino.dart';

import '../data/model/response/new_product_model.dart';

class NewProductProvider with ChangeNotifier{
final NewProductRepo newproRepo;

NewProductProvider({required this.newproRepo});

List<NewProductModel> _newProList=[];
List<NewProductModel> get newProList=>_newProList;


void getNewProductList()async{
  _newProList.clear();
  _newProList=await newproRepo.getProducts();
  print(("Product"));
  print(_newProList.length);
  print(_newProList);
  notifyListeners();
}

}