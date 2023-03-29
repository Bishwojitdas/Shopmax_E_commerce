import 'package:e_commerce_app/data/model/response/popular_product_model.dart';
import 'package:e_commerce_app/data/repository/popular_product_repo.dart';
import 'package:flutter/cupertino.dart';

class PopularProductProvider with ChangeNotifier{
  final PopularProductRepo poProRepo;

  PopularProductProvider({required this.poProRepo});

  List<PopularProductModel> _poProList=[];
  List<PopularProductModel> get poProList=>_poProList;


  void getPopularProductList()async{
    _poProList.clear();
    _poProList=await poProRepo.getPopularProducts();
    print(("Product"));
    print(_poProList.length);
    print(_poProList);
    notifyListeners();
  }

}