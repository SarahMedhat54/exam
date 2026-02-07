
import 'package:exam_flutter/model/item_model.dart';
import 'package:flutter/material.dart';

class ItemProvider extends ChangeNotifier {
  final List<ItemModel> selectItem = [] ;
  ItemModel? lastAddedItem;

  List<ItemModel> get select =>selectItem ;
  ItemModel? get laastAddedItem => lastAddedItem;

  double get totalPrice {
    return selectItem.fold(0, (sum, item) => sum + item.price);
  }



  void addCart( ItemModel item)
  {
    item.isSelected = true;
    item.quantity = 1;
    selectItem.add(item) ;
    notifyListeners();
  }

  void count(ItemModel item) {
    item.quantity++;
    notifyListeners();
  }

  void decrement(ItemModel item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      item.isSelected = false ;
      item.quantity = 0;
      selectItem.remove(item);
    }
    notifyListeners();
  }

  void removeCart( ItemModel item)
  {
    selectItem.remove(item);
    notifyListeners();
  }




}