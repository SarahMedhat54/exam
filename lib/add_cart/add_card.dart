import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/app_colors.dart';
import '../provider/item_provider.dart';
import '../widgets/custom_card.dart';

class AddCard extends StatelessWidget {
  const AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<ItemProvider>();
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new, color: AppColors.blue, size: 20),
        ),
        title: Text(
          "My Cart",
          style: TextStyle(color: AppColors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
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
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                _buildSummaryRow("Items Total", "EGP ${cartProvider.totalPrice}", Colors.black),
                const SizedBox(height: 12),
                _buildSummaryRow("Shipping Fee", "Free", Colors.green),
                const Divider(height: 30, thickness: 0.5),
                _buildSummaryRow("Total", "EGP ${cartProvider.totalPrice}", const Color(0XFF2F2F2F), isBold: true),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              "${cartProvider.select.length} Items",
              style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.select.length,
              itemBuilder: (context, index) {
                return CustomCard(items: cartProvider.select[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildSummaryRow(String label, String value, Color valColor, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 15)),
        Text(
          value,
          style: TextStyle(
            color: valColor,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            fontSize: isBold ? 17 : 15,
          ),
        ),
      ],
    );
  }
}