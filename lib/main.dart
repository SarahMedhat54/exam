import 'package:exam_flutter/data/data_model.dart';
import 'package:exam_flutter/provider/item_provider.dart';
import 'package:exam_flutter/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) =>  ItemProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(items: items),

      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
