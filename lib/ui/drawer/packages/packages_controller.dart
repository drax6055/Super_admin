import 'package:get/get.dart';
import 'package:flutter_template/network/dio.dart';
import '../../../main.dart';
import '../../../network/model/packages.dart';
import '../../../network/network_const.dart';

class PackagesController extends GetxController {
  var packages = <Package>[].obs;
  final DioClient dioClient = DioClient();

  @override
  void onInit() {
    fetchPackages();
    super.onInit();
  }

  void fetchPackages() async {
    try {
      PackagesResponse response =
          await getPackages('${Apis.PackagesbaseUrl}${Endpoints.packages}');
      packages.value = response.packages;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<PackagesResponse> getPackages(String endpoint) async {
    final response = await dioClient.dio.get(endpoint);
    try {
      if (response.statusCode == 200) {
        return PackagesResponse.fromJson(response.data);
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      final errorMessage = e.toString();
      throw errorMessage;
    }
  }
}
