import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class AddCard extends StatelessWidget {
  const AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
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
            padding: EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          
          
          
          )
        ],
      ),
    );
  }
}
