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
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor:  AppColors.white,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios_new,color:  AppColors.blue,)),
        title: Text(" My Cart", style: TextStyle(color: AppColors.black, fontSize: 14),),
        centerTitle: true,
        actions: [
          Icon(Icons.shopping_bag_sharp, color: AppColors.blue,),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total Amount",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "EGP ${cartProvider.totalPrice}",
                  style: TextStyle(fontSize: 14, color: AppColors.black, fontWeight: FontWeight.bold),
                ),
              ],
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              onPressed: () {},
              child: const Text("Checkout", style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),

      // Container(
      // margin: const EdgeInsets.all(16),
      // padding: const EdgeInsets.all(16),
      // decoration: BoxDecoration(
      //   color: Colors.grey[50],
      //   borderRadius: BorderRadius.circular(12),
      // ),
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     const Text(
      //       "Total Amount",
      //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      //     ),
      //
      //     Padding(
      //       padding: EdgeInsets.all(16),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text("Total", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      //           Text("EGP ${cartProvider.totalPrice}", style: const TextStyle(fontSize: 18)),
      //           Text(
      //             "EGP ${cartProvider.totalPrice.toStringAsFixed(2)}",
      //             style: TextStyle(
      //               fontSize: 18,
      //               fontWeight: FontWeight.bold,
      //               color: AppColors.blue,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Expanded(
      //       child: ListView.builder(
      //         itemCount: cartProvider.select.length,
      //         padding: const EdgeInsets.symmetric(horizontal: 8),
      //         itemBuilder: (context, index) {
      //           return CustomCard(items: cartProvider.select[index]);
      //         },
      //       ),
      //     ),
      //     Padding(
      //         padding: const EdgeInsets.all(16.0),
      //         child: ElevatedButton(
      //           style: ElevatedButton.styleFrom(
      //             backgroundColor: AppColors.blue,
      //             minimumSize: const Size(double.infinity, 55),
      //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      //           ),
      //           onPressed: () {},
      //           child: const Text(
      //             "Checkout",
      //             style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      //           ),
      //         ),
      //     ),
      //   ],
      // ),
      //     ),
      //   ],
     // ),
    );
  }
}
