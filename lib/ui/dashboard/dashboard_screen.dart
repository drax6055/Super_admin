import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/ui/dashboard/dashboard_controller.dart';
import 'package:flutter_template/utils/colors.dart';
import 'package:flutter_template/wiget/custome_text.dart';
import 'package:get/get.dart';
import '../../utils/custom_text_styles.dart';
import '../../wiget/appbar/commen_appbar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController getController = Get.put(DashboardController());

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Dashboard',
        ),
        body: Column(
          children: [],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              SizedBox(
                height: 10.h,
              ),
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: primaryColor,
                ),
                accountName: CustomTextWidget(
                    text: 'Dharmik Thakker',
                    textStyle: CustomTextStyles.textFontMedium(
                        size: 14.sp, color: white)),
                accountEmail: CustomTextWidget(
                    text: 'dharmik@example.com',
                    textStyle: CustomTextStyles.textFontMedium(
                        size: 12.sp, color: white)),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: secondaryColor,
                  child: CustomTextWidget(
                    text: 'DT',
                    textStyle: CustomTextStyles.textFontMedium(
                        size: 20.sp, color: white),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.dashboard),
                title: CustomTextWidget(
                    text: 'Dashboard',
                    textStyle: CustomTextStyles.textFontMedium(size: 15.sp)),
                onTap: () async {},
              ),
              ListTile(
                leading: Icon(Icons.calendar_month),
                title: CustomTextWidget(
                    text: 'Calender Booking',
                    textStyle: CustomTextStyles.textFontMedium(size: 15.sp)),
                onTap: () async {},
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: CustomTextWidget(
                    text: 'Logout',
                    textStyle: CustomTextStyles.textFontMedium(size: 15.sp)),
                onTap: () async {
                  await getController.onLogoutPress();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
