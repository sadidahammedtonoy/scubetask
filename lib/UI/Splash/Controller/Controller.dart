import 'package:get/get.dart';
import '../../../App/routes.dart';

class splash_controler extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(milliseconds: 1500), () async {
      Get.offAllNamed(routes.scube_home_screen);
    });
  }

}