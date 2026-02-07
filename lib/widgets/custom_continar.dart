import 'package:exam_flutter/core/app_colors.dart';
import 'package:exam_flutter/core/app_textstyle.dart';
import 'package:exam_flutter/data/data_model.dart';
import 'package:exam_flutter/model/item_model.dart';
import 'package:flutter/material.dart';

class CustomContinar extends StatelessWidget {
  final ItemModel items ;
  const CustomContinar({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.grey[100],
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
      Expanded(child: Image.asset(items.image , fit: BoxFit.contain,)),
           //),
          SizedBox(height: 10,),
          Text(items.title ,maxLines: 2,overflow: TextOverflow.ellipsis, style: AppTextstyle.black12,),
          SizedBox(height: 10,),
          Row(
            children: [
              Icon(Icons.star, color: AppColors.yellow,),
              //SizedBox(width: 5,),
              Text(items.rate,style: AppTextstyle.gray10,
                ),
            ],
          ),
          Row(
            children: [
              Text("${items.price.toStringAsFixed(0)} EGP"),
              SizedBox(width: 5,),
              IconButton(onPressed: (){}, icon: Icon(Icons.add , color: AppColors.blue,))
            ],
          )
        ],
      ),
    );
  }
}
