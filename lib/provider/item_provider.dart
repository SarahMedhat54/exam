
import 'package:exam_flutter/model/item_model.dart';
import 'package:flutter/material.dart';

class ItemProvider extends ChangeNotifier {
  final List<ItemModel> select = [] ;
  void addCart( ItemModel  product)
  {
    select.add(product) ;
    notifyListeners();
  }

  void removeCart( ItemModel product)
  {
    select.remove(product);
    notifyListeners();
  }




}