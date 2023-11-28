import 'package:flutter/material.dart';
import 'package:news_app/screens/splash.dart';
import 'package:get/get.dart';
void main()=>runApp(const NewsApp());
class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

