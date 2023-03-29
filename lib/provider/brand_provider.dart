import 'package:e_commerce_app/data/model/response/brand_model.dart';
import 'package:e_commerce_app/data/repository/brand_repo.dart';
import 'package:flutter/cupertino.dart';

class BrandProvider with ChangeNotifier{
  BrandRepo brandRepo;

BrandProvider({required this.brandRepo});

List<BrandModel> _brandList=[];
List<BrandModel> get brandList=>_brandList;

Future<void> getBrands()async{
  _brandList=await brandRepo.getBrands();
  debugPrint("Brands: $_brandList");
  notifyListeners();
}

}