import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/ui/dashboard/dashboard_controller.dart';
import 'package:flutter_template/utils/colors.dart';
import 'package:get/get.dart';
import '../../wiget/appbar/commen_appbar.dart';
import '../../wiget/custome_text.dart';

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
                accountName: Text('John Doe'),
                accountEmail: Text('john.doe@example.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Text(
                    'JD',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Salons'),
                onTap: () async {
                  await getController.onLogoutPress();
                },
              ),
              ListTile(
                leading: Icon(Icons.local_offer),
                title: Text('Packages'),
                onTap: () async {
                  await getController.onLogoutPress();
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
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
