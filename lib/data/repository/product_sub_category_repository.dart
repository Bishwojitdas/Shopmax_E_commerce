import 'package:e_commerce_app/util/images.dart';

import '../model/response/product_sub_category_model.dart';

class ProductSubCategoryRepo{
  List<ProductSubCategoryModel>? prosubcatList=[
    ProductSubCategoryModel(id: 1, categoryId: 6, subCategoryImage: "assets/images/fashion.png", subCategoryName: "Man Shirt"),
    ProductSubCategoryModel(id: 2, categoryId: 6, subCategoryImage: "assets/images/fashion.png", subCategoryName: "Man Equipment"),
    ProductSubCategoryModel(id: 3, categoryId: 6, subCategoryImage: "assets/images/fashion.png", subCategoryName: "Man T-Shirt"),
    ProductSubCategoryModel(id: 4, categoryId: 6, subCategoryImage: "assets/images/fashion.png", subCategoryName: "Man Shoes"),
    ProductSubCategoryModel(id: 5, categoryId: 6, subCategoryImage: "assets/images/fashion.png", subCategoryName: "Man Pants"),
    ProductSubCategoryModel(id: 6, categoryId: 6, subCategoryImage: "assets/images/fashion.png", subCategoryName: "Man Underwear"),
    ProductSubCategoryModel(id: 1, categoryId: 6, subCategoryImage: "assets/images/fashion.png", subCategoryName: "Man Shirt"),
    ProductSubCategoryModel(id: 2, categoryId: 6, subCategoryImage: "assets/images/fashion.png", subCategoryName: "Man Equipment"),
    ProductSubCategoryModel(id: 3, categoryId: 6, subCategoryImage: "assets/images/fashion.png", subCategoryName: "Man T-Shirt"),
    ProductSubCategoryModel(id: 4, categoryId: 6, subCategoryImage: "assets/images/fashion.png", subCategoryName: "Man Shoes"),
    ProductSubCategoryModel(id: 5, categoryId: 6, subCategoryImage: "assets/images/fashion.png", subCategoryName: "Man Pants"),
    ProductSubCategoryModel(id: 6, categoryId: 6, subCategoryImage: "assets/images/fashion.png", subCategoryName: "Man Underwear"),

  ];

  Future<List<ProductSubCategoryModel>?> getProductSubCategoryListData()async{
    return prosubcatList;
  }

}