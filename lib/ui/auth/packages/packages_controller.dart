import 'package:flutter_template/main.dart';
import 'package:get/get.dart';
import '../../../network/model/packages.dart';
import '../../../network/network_const.dart';

class PackagesController extends GetxController {
  var packages = <Package>[].obs;
  var selectedPackageId = RxnInt();
  var selectedIndex = 1.obs;

  @override
  void onInit() {
    fetchPackages();
    super.onInit();
  }
 void toggleGender(int index) {
    selectedIndex.value = index;
  }
  
  void fetchPackages() async {
    try {
      final response = await dioClient.dio.get('${Apis.PackagesbaseUrl}${Endpoints.packages}');
      if (response.statusCode == 200) {
        PackagesResponse packagesResponse = PackagesResponse.fromJson(response.data);
        packages.value = packagesResponse.packages;
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void updateSelected(int value) {
    selectedPackageId.value = value;
  }
}
