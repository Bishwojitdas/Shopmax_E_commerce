
import 'package:e_commerce_app/data/model/response/new_product_model.dart';

class CartModel {
NewProductModel? newProductModel;
dynamic? quantity;

CartModel(this.newProductModel, this.quantity);

CartModel.fromJson(Map<String, dynamic>json){
  newProductModel=json['product']!=null?
  NewProductModel.fromJson(json['product']): null;
  quantity=json['quantity'];
}
Map<String, dynamic> toJson(){
  final Map<String, dynamic> data=new Map<String, dynamic>();
  data['product']=this.newProductModel;
  data['quantity']=this.quantity;
  return data;
}

}

