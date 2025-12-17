import 'package:get/get.dart';
import '../UI/Authentication/Login/Controller/Controller.dart';
import '../UI/Features/Data_preview/Controller/Controller.dart';
import '../UI/Features/Home/Controller/Controller.dart';
import '../UI/Splash/Controller/Controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<splash_controler>(() => splash_controler(), fenix: true);
    Get.lazyPut<home_controller>(() => home_controller(), fenix: true);
    Get.lazyPut<login_controller>(() => login_controller(), fenix: true);
    Get.lazyPut<data_preview_controller>(() => data_preview_controller(), fenix: true);

  }
}
