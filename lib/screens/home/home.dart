import 'package:exam_flutter/core/app_colors.dart';
import 'package:exam_flutter/core/app_textstyle.dart';
import 'package:exam_flutter/widgets/custom_card.dart';
import 'package:exam_flutter/widgets/custom_continar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/item_model.dart';
import '../../provider/item_provider.dart';

class Home extends StatelessWidget {
  final List<ItemModel> items;

  Home({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<ItemProvider>();
    return Scaffold(
      backgroundColor:  Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor:Color(0xFFF8F8F8),
        elevation: 0,
        leadingWidth: 0,
        title: Row(
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 35,
              fit: BoxFit.contain,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 8),
            child: Stack(
              children: [
                Icon(Icons.shopping_bag_outlined, color: AppColors.blue, size: 28),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Text(
                      "${cartProvider.select.length}",
                      style: const TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Recommendations", style: AppTextstyle.black6),
          ),
          //SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,

                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return CustomContinar(items: items[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
