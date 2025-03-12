import 'package:get/get.dart';
import '../../../main.dart';
import '../../../network/model/packages.dart';
import '../../../network/network_const.dart';

class PackagesController extends GetxController {
  var packages = <Package>[].obs;
  var selectedPackageId = RxnInt();
  var selectedIndex = 0.obs; // 0 = Monthly (default), 1 = Yearly
  var filteredPackages = <Package>[].obs;

  @override
  void onInit() {
    fetchPackages();
    super.onInit();
  }

  void toggleGender(int index) {
    selectedIndex.value = index;
    filterPackages();
  }

  void fetchPackages() async {
    try {
      final response = await dioClient.dio.get('${Apis.PackagesbaseUrl}${Endpoints.packages}');
      if (response.statusCode == 200) {
        PackagesResponse packagesResponse = PackagesResponse.fromJson(response.data);
        packages.value = packagesResponse.packages;
        filterPackages(); // Filter on initial load
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void filterPackages() {
    if (selectedIndex.value == 0) {
      filteredPackages.value = packages.where((pkg) => pkg.subscriptionPlan.toLowerCase() == "monthly").toList();
    } else {
      filteredPackages.value = packages.where((pkg) => pkg.subscriptionPlan.toLowerCase() == "yearly").toList();
    }
  }

  void updateSelected(int value) {
    selectedPackageId.value = value;
  }
}
