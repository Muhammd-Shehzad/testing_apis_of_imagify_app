import 'package:flutter/material.dart';
import 'package:testing_apis_of_imagify_app/view/kalmaScreen/kamla_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: KamlaScreen());
  }
}
