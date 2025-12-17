import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scubetask/App/routes.dart';

class login_controller extends GetxController{
  var password_toggle = true.obs;

  Future<void> login(String username, String password) async {
    debugPrint("Username: $username, Password: $password");
    Get.offAllNamed(routes.scube_home_screen);
  }
}