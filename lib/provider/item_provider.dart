
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
    selectItem.add(item) ;
    notifyListeners();
  }

  void removeCart( ItemModel item)
  {
    selectItem.remove(item);
    notifyListeners();
  }




}