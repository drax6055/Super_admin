import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_template/utils/app_images.dart';
import 'package:flutter_template/utils/colors.dart';
import 'package:flutter_template/ui/auth/packages/packages_controller.dart';

import '../../../network/model/packages.dart';
import '../../../wiget/appbar/commen_appbar.dart';

class PackagesScreen extends StatelessWidget {
  PackagesScreen({super.key});

  final PackagesController getController = Get.put(PackagesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Select Prefreble Package"),
      body: Column(
        children: [
          SizedBox(height: 10.h),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Obx(() {
                    if (getController.packages.isEmpty) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return Column(
                      children: getController.packages
                          .map((pkg) => _buildRadioCard(pkg))
                          .toList(),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioCard(Package pkg) {
    return Obx(() => GestureDetector(
          onTap: () => getController.updateSelected(pkg.id),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: getController.selectedPackageId.value == pkg.id ? 4 : 2,
            child: ListTile(
              leading: Radio<int>(
                value: pkg.id,
                groupValue: getController.selectedPackageId.value,
                onChanged: (int? newValue) {
                  if (newValue != null) {
                    getController.updateSelected(newValue);
                  }
                },
              ),
              title:
                  Text(pkg.name, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pkg.description),
                  ...pkg.servicesIncluded
                      .map((service) =>
                          Text("• $service", style: TextStyle(fontSize: 12)))
                      .toList(),
                  Text("Plan: ${pkg.subscriptionPlan}"),
                  Text("₹${pkg.price}"),
                ],
              ),
            ),
          ),
        ));
  }
}
