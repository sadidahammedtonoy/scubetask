import 'package:flutter/material.dart';
import 'package:scubetask/App/AppColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../App/assets_path.dart';
import 'package:get/get.dart';
import '../Controller/Controller.dart';

class scube_login extends StatelessWidget {
  scube_login({super.key});
  final controller = Get.find<login_controller>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          const SizedBox(height: 100),
          Image.asset(assets_path.home),
          const SizedBox(height: 10),
          Text("SCUBE", style: TextStyle(color: Colors.white, fontSize: 24.sp, fontWeight: FontWeight.bold),),
          Text("Control & Monitoring System", style: TextStyle(color: Colors.white, fontSize: 18.sp),),
          const SizedBox(height: 50),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 30),
                        Text("Login", style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),),
                        const SizedBox(height: 20),
                        TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please Enter Username";
                            }
                            return null;
                          },
                            controller: username,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Username",
                            hintStyle: TextStyle(fontSize: 14.sp),
                          )
                        ),
                        const SizedBox(height: 20),
                        Obx(() =>
                            TextFormField(
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "Please Enter Password";
                                  }else if(value.length < 6){
                                    return "Password must be at least 6 characters";
                                  }
                                  return null;
                                },
                                controller: password,
                                obscureText: controller.password_toggle.value,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(fontSize: 14.sp),
                                    suffixIcon: GestureDetector(
                                        onTap: (){
                                          controller.password_toggle.value = !controller.password_toggle.value;
                                        },
                                        child: Icon(controller.password_toggle.value ? Icons.visibility_off : Icons.visibility, size: 18.sp,))
                                )
                            ),
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(onPressed: (){}, child: Text("Forget Password"))),
                        ElevatedButton(onPressed: (){
                          if(_formKey.currentState!.validate()){
                            controller.login(username.text, password.text);
                          }
                        }, child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 18.sp),)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don’t have any account?"),
                            TextButton(onPressed: (){}, child: Text("Register Now", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}