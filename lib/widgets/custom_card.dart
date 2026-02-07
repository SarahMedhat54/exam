import 'dart:ui';
import 'package:exam_flutter/core/app_colors.dart';
import 'package:exam_flutter/core/app_textstyle.dart';
import 'package:exam_flutter/provider/item_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/item_model.dart';

class CustomCard extends StatelessWidget {
  final ItemModel items;

  const CustomCard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: AppColors.gray,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(items.image),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  items.name,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                SizedBox(height: 5),
                Text(items.title, style: AppTextstyle.gray12),
                SizedBox(height: 5),
                Text(
                  "EGP ${items.price}",
                  style:  TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  context.read<ItemProvider>().removeCart(items);
                },
                icon: Icon(Icons.delete_outline, color: Colors.red),
              ),
              Row(
                children: [
                   Icon(Icons.remove, size: 20),
                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("1"),
                  ),
                   Icon(Icons.add_box, color: Color(0xFF004AAD), size: 20),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
