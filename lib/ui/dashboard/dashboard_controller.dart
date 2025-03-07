import 'package:get/get.dart';
import '../../commen_items/sharePrafrence.dart';


class DashboardController extends GetxController {

  final SharedPreferenceManager _prefs = SharedPreferenceManager();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> onLogoutPress() async {
    await _prefs.onLogout();
  }

}
