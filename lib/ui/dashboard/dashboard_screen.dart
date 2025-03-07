import 'package:flutter/material.dart';
import 'package:flutter_template/ui/dashboard/dashboard_controller.dart';
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
        appBar: CustomAppBar(title: 'Dashboard'),
        body: Column(
           children: [
            CustomTextWidget(
              text: 'Welcome to Dashboard',
              textAlign: TextAlign.start,
            ),
            ElevatedButton(
              onPressed: () async {
                await getController.onLogoutPress();
              },
              child: Text('Logout')),
           ],
        ),
      ),
    );
  }
}
