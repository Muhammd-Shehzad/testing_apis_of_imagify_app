import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_apis_of_imagify_app/view/Quran/quran_screen.dart';
import 'package:testing_apis_of_imagify_app/view/Quran/quran_screen_view_model.dart';
import 'package:testing_apis_of_imagify_app/view/kalmaScreen/kalma_screen_view_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => KalmaScreenViewModel()),
        ChangeNotifierProvider(create: (_) => QuranScreenViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: QuranScreen(),
      ),
    );
  }
}
