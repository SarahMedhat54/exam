import 'package:exam_flutter/core/app_colors.dart';
import 'package:exam_flutter/core/app_textstyle.dart';
import 'package:exam_flutter/data/data_model.dart';
import 'package:exam_flutter/provider/item_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/item_model.dart';

class CustomBottomsheet extends StatelessWidget {
  final ItemModel items ;

  final String Name;
  final VoidCallback onCart;
  final VoidCallback onContinueShopping;

  const CustomBottomsheet({
    super.key,
    required this.Name,
    required this.onCart,
    required this.onContinueShopping, required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final cart = context.read<ItemProvider>();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          //Text(items)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Added to cart", style: TextStyle(color: Colors.grey, fontSize: 15)),
              SizedBox(width: 8),
              Icon(Icons.check_circle, color: Colors.green, size: 22),
            ],
          ),
          SizedBox(height: 10,),
          ElevatedButton(
               style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
            onPressed: () {},
            child: Text("View Card", style: TextStyle(color: AppColors.white)),
          ),
          SizedBox(height: 10,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            onPressed:() => Navigator.pop(context),
            child: Text("continue shopping", style: TextStyle(color: AppColors.blue)),
          ),

        ],
      ),
    );
  }
}
