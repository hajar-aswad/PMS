import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pms/controller/screen/main_controller.dart';
import 'package:pms/view/dashboardScreen/dashboard_screen.dart';
import 'package:pms/view/main_screen/widget/responsive.dart';
import 'package:pms/view/main_screen/widget/sidemenu.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(flex: 1, child: SideMenu()),
            GetBuilder<MainController>(
              builder: (controller) =>
                  const Expanded(flex: 5, child: DashBoardScreen()),
            ),
          ],
        ),
      ),
      drawer: const SideMenu(),
    );
  }
}
