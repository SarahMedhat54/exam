import 'package:exam_flutter/core/app_colors.dart';
import 'package:exam_flutter/core/app_textstyle.dart';
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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: double.infinity,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F2F2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(items.image, fit: BoxFit.contain),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  items.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextstyle.black12,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: AppColors.yellow, size: 14),
                    const SizedBox(width: 4),
                    Text(items.rate, style: AppTextstyle.gray12),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "${items.price.toStringAsFixed(2)} EGP",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (items.isSelected)
                      Flexible(
                        child: FittedBox(
                          child: Container(
                            margin: const EdgeInsets.only(left: 4),
                            decoration: BoxDecoration(
                              color: AppColors.blue,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () => provider.decrement(items),
                                  child: const Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Icon(Icons.remove, color: Colors.white, size: 16),
                                  ),
                                ),
                                Text(
                                  "${items.quantity}",
                                  style: const TextStyle(color: Colors.white, fontSize: 12),
                                ),
                                GestureDetector(
                                  onTap: () => provider.count(items),
                                  child: const Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Icon(Icons.add, color: Colors.white, size: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    GestureDetector(
                      onTap: () {
                        context.read<ItemProvider>().lastAddedItem = items;
                        context.read<ItemProvider>().addCart(items);
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (context) => CustomBottomsheet(items: items),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 4),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.blue.withOpacity(0.3)),
                        ),
                        child: Icon(Icons.add_shopping_cart_outlined,
                            color: AppColors.blue,
                            size: 18
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}