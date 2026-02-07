import 'package:exam_flutter/add_cart/add_card.dart';
import 'package:exam_flutter/core/app_colors.dart';
import 'package:exam_flutter/core/app_textstyle.dart';
import 'package:exam_flutter/data/data_model.dart';
import 'package:exam_flutter/provider/item_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/item_model.dart';

class CustomBottomsheet extends StatelessWidget {
  final ItemModel items ;


  const CustomBottomsheet({
    super.key,
   required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final lastItem = context.read<ItemProvider>().lastAddedItem;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      //width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(lastItem?.title ?? "NO",textAlign: TextAlign.center,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          SizedBox(height:12 ,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Added to cart", style: TextStyle(color: Colors.grey, fontSize: 15)),
              SizedBox(width: 8),
              Icon(Icons.check_circle, color: Colors.green, size: 22),
            ],
          ),
          SizedBox(height: 15,),
          Expanded(
            child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blue,
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
              onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => AddCard(),));},
              child: Text("View Card", style: TextStyle(color: AppColors.white)),
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              onPressed:() => Navigator.pop(context),
              child: Text("Continue Shopping", style: TextStyle(color: AppColors.blue)),
            ),
          ),

        ],
      ),
    );
  }
}
