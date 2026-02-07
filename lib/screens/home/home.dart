import 'package:exam_flutter/core/app_colors.dart';
import 'package:exam_flutter/core/app_textstyle.dart';
import 'package:exam_flutter/widgets/custom_card.dart';
import 'package:exam_flutter/widgets/custom_continar.dart';
import 'package:flutter/material.dart';

import '../../model/item_model.dart';

class Home extends StatelessWidget {
  final List<ItemModel> items;

  Home({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/images/logo.png"),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_bag, color: AppColors.blue),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Recommendations", style: AppTextstyle.lightBlack14),
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.4,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,

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
