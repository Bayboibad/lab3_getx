import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab3_getx/views/home.dart';
import 'package:lab3_getx/views/layout_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/home',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.native,
      getPages: [
        GetPage(
          name: "/home",
          page: () => const HomePage(),
        ),
        GetPage(
          name: "/itempro",
          page: () =>  const LayoutItem(),
        )
      ],
    );
  }
}
