import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scubetask/App/routes.dart';

import 'Binding.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 815),
      builder: (_, __) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: InitialBinding(),
        getPages: routes.pages,
        initialRoute: routes.splash_screen,
      ),
    );
  }
}