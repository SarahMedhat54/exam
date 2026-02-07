import 'package:exam_flutter/core/app_colors.dart';
import 'package:exam_flutter/core/app_textstyle.dart';
import 'package:exam_flutter/data/data_model.dart';
import 'package:exam_flutter/model/item_model.dart';
import 'package:exam_flutter/widgets/custom_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/item_provider.dart';

class CustomContinar extends StatelessWidget {
  final ItemModel items;

  const CustomContinar({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ItemProvider>();
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 12),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        //color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: AppColors.gray),
              child: Center(
                child: Image.asset(items.image, fit: BoxFit.contain),
              ),
            ),
          ),
          //),
          SizedBox(height: 10),
          Text(
            items.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextstyle.black12,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.star, color: AppColors.yellow, size: 12),
              //SizedBox(width: 5,),
              Text(items.rate, style: AppTextstyle.gray12),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "${items.price.toStringAsFixed(2)} EGP",
                  style: TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              !items.isSelected
                  ? GestureDetector(
                      onTap: () => provider.addCart(items),
                      child: Icon(
                        Icons.add_circle_outline_sharp,
                        color: Colors.grey,
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => provider.decrement(items),
                            icon: Icon(Icons.remove),
                          ),
                          Text(
                            "${items.quantity}",
                            style: TextStyle(color: Colors.white),
                          ),
                          IconButton(
                            constraints: const BoxConstraints(),
                            padding: EdgeInsets.zero,
                            onPressed: () => provider.count(items),
                            icon: Icon(Icons.add, color: Colors.white),
                          ),
                        ],
                      ),
                    ),

              SizedBox(width: 5),
              IconButton(
                onPressed: () {
                  context.read<ItemProvider>().lastAddedItem = items;
                  context.read<ItemProvider>().addCart(items);
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) => CustomBottomsheet(items: items),
                  );
                },
                icon: Icon(Icons.add, color: AppColors.blue),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
