import 'package:get/get.dart';
import '../UI/Authentication/Login/View/login.dart';
import '../UI/Features/Home/View/home.dart';
import '../UI/Splash/View/splash.dart';
import 'Binding.dart';

class routes {
  static const String splash_screen = '/splash';
  static const String scube_home_screen = '/scube_home';
  static const String scube_login_screen = '/scube_login';


  static final pages = [
    GetPage( name: splash_screen, binding: InitialBinding(), page: () =>  splash()),
    GetPage( name: scube_home_screen, binding: InitialBinding(), page: () =>  scube_home()),
    GetPage( name: scube_login_screen, binding: InitialBinding(), page: () =>  scube_login()),

  ];
}


