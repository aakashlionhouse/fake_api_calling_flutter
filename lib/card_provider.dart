import 'package:flutter/cupertino.dart';
import 'package:product_api/product_model.dart';

class CartProvider with ChangeNotifier{
  final List<Product>_addCart=[];
  List<Product>get addCart=>_addCart;
  void addToCart(Product product){
    _addCart.add(product);
    notifyListeners();
  }
  void removeToCart(Product product){
    _addCart.remove(product);
    notifyListeners();
  }
  double get overAllPrice{
    return _addCart.fold(0.0, (sum,item)=>sum+double.parse("${item.price}"));
  }
}
