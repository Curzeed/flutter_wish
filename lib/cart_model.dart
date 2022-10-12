import 'package:flutter/foundation.dart';
import 'package:flutter_sales/product_model.dart';

class CartModel extends ChangeNotifier{
  final List<Product> lsProduct;


  CartModel(this.lsProduct);

  void add(Product product){
      lsProduct.add(product);
      notifyListeners();
    }

    void remove(Product product){
      lsProduct.remove(product);
      notifyListeners();
    }

    void removeAll(){
      lsProduct.clear();
      notifyListeners();
    }
    getPrice(){
      return lsProduct.fold<num>(0, (sum, element) => sum + element.price);
    }
}