import 'package:get/get.dart';
import '../UI/Splash/Controller/Controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<splash_controler>(() => splash_controler(), fenix: true);

  }
}
