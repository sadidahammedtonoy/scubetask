import 'package:flutter/material.dart';
import 'package:scubetask/App/AppColors.dart';
import 'package:scubetask/App/assets_path.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Controller/Controller.dart';

class splash extends StatelessWidget {
  splash({super.key});
  final controller = Get.find<splash_controler>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: double.infinity,),
              Image.asset(assets_path.home),
              const SizedBox(height: 10),
              Text("SCUBE", style: TextStyle(color: Colors.white, fontSize: 24.sp, fontWeight: FontWeight.bold),),
              Text("Control & Monitoring System", style: TextStyle(color: Colors.white, fontSize: 18.sp),),
            ],
          ),
        ),
      ),
    );
  }
}
