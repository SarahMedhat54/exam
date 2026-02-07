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
    final provider = context.watch()<ItemProvider>();
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        //color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   height: 110,
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //     color: AppColors.lightGray,
          //     borderRadius: BorderRadius.circular(12),
          //   ),
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(12),
          // child:
          Expanded(child: Image.asset(items.image, fit: BoxFit.contain,)),
          //),
          SizedBox(height: 10,),
          Text(items.title, maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextstyle.black12,),
          SizedBox(height: 10,),
          Row(
            children: [
              Icon(Icons.star, color: AppColors.yellow,),
              //SizedBox(width: 5,),
              Text(items.rate, style: AppTextstyle.gray10,
              ),
            ],
          ),
          Row(
            children: [
              Text("${items.price.toStringAsFixed(0)} EGP"),
              !items.isSelected ? GestureDetector(
                onTap: () => provider.addCart(items),
                child: Icon(
                  Icons.add_circle_outline_sharp, color: Colors.grey,),
              ) : Container(padding: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16)
                ),
                child:  Row(
                  children: [
                    IconButton(onPressed: ()=> provider.decrement(items), icon: Icon(Icons.remove)),
                        Text("${items.quantity}", style:  TextStyle(color:  Colors.white,),),
                    IconButton(constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                        onPressed: () => provider.increment(items), icon: Icon(Icons.add,color: Colors.white,))
                  ],
                ),
              ),

              SizedBox(width: 5,),
              IconButton(onPressed: () {
                context
                    .read<ItemProvider>()
                    .lastAddedItem = items;
                context.read<ItemProvider>().addCart(items);
                showModalBottomSheet(context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => CustomBottomsheet(items: items),)

                ;
              }, icon: Icon(Icons.add, color: AppColors.blue,))
            ],
          )
        ],
      ),
    );
  }
}
