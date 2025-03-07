import 'package:flutter_template/ui/auth/login_screen.dart';
import 'package:flutter_template/ui/dashboard/dashboard_screen.dart';
import 'package:get/get.dart';
import '../ui/splash/splash_screen.dart';
import 'app_route.dart';

class AppPages {
  static const initial = Routes.splashScreen;
  static final routes = [
    GetPage(
        name: Routes.splashScreen,
        page: () => SplashScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: Routes.loginScreen,
        page: () => LoginScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: Routes.dashboardScreen,
        page: () => DashboardScreen(),
        transition: Transition.rightToLeft),
  ];
}
