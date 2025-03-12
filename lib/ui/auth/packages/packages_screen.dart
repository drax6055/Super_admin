import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_template/utils/app_images.dart';
import 'package:flutter_template/utils/colors.dart';
import 'package:flutter_template/ui/auth/packages/packages_controller.dart';

import '../../../network/model/packages.dart';

class PackagesScreen extends StatelessWidget {
  PackagesScreen({super.key});

  final PackagesController getController = Get.put(PackagesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Packages_header(),
          SizedBox(height: 50.h),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10.h),
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

  Widget Packages_header() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: 120.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r),
            ),
          ),
        ),
        Positioned(
          bottom: -50,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: 10, color: secondaryColor, spreadRadius: 6),
              ],
            ),
            child: CircleAvatar(
              radius: 70,
              backgroundColor: primaryColor,
              foregroundImage: AssetImage(AppImages.applogo),
            ),
          ),
        ),
      ],
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
                  Text("₹${pkg.price}"),
                  Text(pkg.description),
                  ...pkg.servicesIncluded
                      .map((service) =>
                          Text("• $service", style: TextStyle(fontSize: 12)))
                      .toList(),
                  Text("Plan: ${pkg.subscriptionPlan}"),
                ],
              ),
            ),
          ),
        ));
  }
}
