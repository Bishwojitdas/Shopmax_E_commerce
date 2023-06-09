
import 'package:e_commerce_app/data/model/response/cart_model.dart';
import 'package:e_commerce_app/data/repository/cart_repo.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final CartRepo cartRepo;
  CartProvider({required this.cartRepo});

  List<CartModel> _cartList=[];
  List<CartModel> get cartList=>_cartList;

  List<int> _chosenShippingMethodIndex=[];
  List<int> get chosenShippingMethodIndex=>_chosenShippingMethodIndex;

  double _amount=0.0;
  double get amount=>_amount;

  List<bool> _isSelectedList=[];
  List<bool> get isSelectedList=>_isSelectedList;

  bool _isSelectAll=true;
  bool get isSelectAll=>_isSelectAll;

  void getCartData(){
    _cartList=[];
    _cartList.addAll(cartRepo.getCartList());
  }

  void addToCart(CartModel cartModel){
    _cartList.add(cartModel);
    _isSelectedList.add(true);
    cartRepo.addToCartList(_cartList);
    _amount=_amount+(cartModel.newProductModel!.price*cartModel.quantity);
    notifyListeners();
  }

  void removeFromCart(int index){
    if(_isSelectedList[index]){
      _amount=_amount-
          (_cartList[index].newProductModel!.price*
              _cartList[index].quantity);
    }
    _cartList.removeAt(index);
    _isSelectedList.removeAt(index);
    cartRepo.addToCartList(_cartList);
    notifyListeners();
  }

  bool isAddedInCart(int id, String variant){
    for(CartModel cartModel in _cartList){
      if(cartModel.newProductModel!.id==id){
        return true;
      } else{
        return false;
      }
    }
    return false;
  }

  void removeCheckoutProduct(List<CartModel> carts){
    carts.forEach((cart) {
      _amount=_amount-(cart.newProductModel!.price*cart.quantity);
      _cartList.removeWhere((cartModel) => cartModel.newProductModel!.
      id==cart.newProductModel!.id);
      _isSelectedList.removeWhere((selected) => selected);
    });
    cartRepo.addToCartList(_cartList);
    notifyListeners();
  }

  void setQuantity(bool isIncrement, int index){
    if(isIncrement){
      _cartList[index].quantity=_cartList[index].quantity+1;
      _isSelectedList[index]? _amount=_amount+_cartList[index]
          .newProductModel!.price:_amount=_amount;
    }
    else{
      _cartList[index].quantity=_cartList[index].quantity-1;
      _isSelectedList[index]?_amount=_amount-_cartList[index].newProductModel!.price
          : _amount=_amount;
    }
    cartRepo.addToCartList(cartList);
    notifyListeners();
  }

  void toogleSelected(int index){
    _isSelectedList[index]=!_isSelectedList[index];
    _amount=0.0;
    for(int i=0; i<_isSelectedList.length; i++){
      if(_isSelectedList[i]){
        _amount=_amount+(_cartList[i].newProductModel!.price
        *_cartList[index].quantity);
      }
    }
    _isSelectedList.forEach((isSelect)=> isSelect?
    null: _isSelectAll=false);
    notifyListeners();
  }

  void toggleAllSelect(){
    _isSelectAll=!_isSelectAll;
    if(_isSelectAll){
      _amount=0.0;
      for(int i=0; i<_isSelectedList.length; i++){
        _isSelectedList[i]=true;
        _amount=_amount+(_cartList[i].newProductModel!.price*
        _cartList[i].quantity);
      }
    }
    else{
      _amount=0.0;
      for(int i=0; i<_isSelectedList.length; i++){
        _isSelectedList[i]=false;
      }
    }
    notifyListeners();
  }


}
