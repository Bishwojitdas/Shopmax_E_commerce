import 'package:e_commerce_app/data/model/response/product_category_model.dart';

class ProductCategoryRepo{

  List<ProductCategoryModel> proCateList=[
ProductCategoryModel(categoryId: 1,categoryImage: "assets/images/fruit.png",categoryName: "Fresh Fruits & Vegetable"),
    ProductCategoryModel(categoryId: 2,categoryImage: "assets/images/cooking_oil_ghee.png",categoryName: "Cooking Oil & Ghee"),
    ProductCategoryModel(categoryId: 3, categoryImage: "assets/images/meat_fish.png",categoryName: "Meat & Fish"),
    ProductCategoryModel(categoryId: 4, categoryImage: "assets/images/bekary_sneaks.png",categoryName: "Bakery & Snacks"),
    ProductCategoryModel(categoryId: 5, categoryImage: "assets/images/dairy_eggs.png",categoryName: "Dairy & Eggs"),
    ProductCategoryModel(categoryId: 6,categoryImage: "assets/images/fashion.png",categoryName: " Fashion"),
  ];

  Future<List<ProductCategoryModel>> getProductCategoryModel()async{
    return proCateList;
  }

}