import 'package:get/get.dart';
import '../UI/Splash/View/splash.dart';
import 'Binding.dart';

class routes {
  static const String splash_screen = '/splash';


  static final pages = [
    GetPage( name: splash_screen, binding: InitialBinding(), page: () =>  splash()),

  ];
}


