import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pms/controller/screen/dashbaord_sreen_controller.dart';
import 'package:pms/controller/screen/main_controller.dart';
import 'package:pms/core/constants/app_dimentions.dart';
import 'package:pms/view/main_screen/widget/responsive.dart';
import 'package:pms/view/widget/handle_request.dart';
import 'component/Heder.dart';

class DashBoardScreen extends GetView<DashboardScreenController> {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardScreenController>(
      builder: (controller) => HandleRequest(
        statusView: controller.statusView,
        child: SafeArea(
          child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppDimentions.defaultPadding),
              child: Column(
                children: [
                  const Header(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: AppDimentions.defaultPadding,
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            controller.mainController.center,
                            if (Responsive.isMobile(context))
                              const SizedBox(
                                height: AppDimentions.defaultPadding,
                              ),
                            if (Responsive.isMobile(context))
                              controller.mainController.detailsCard,
                          ],
                        ),
                      ),
                      if (!Responsive.isMobile(context))
                        const SizedBox(
                          width: AppDimentions.defaultPadding,
                        ),
                      if (!Responsive.isMobile(context))

                        /// it means  that if screnn  is less than 850 then dont  show it
                        Expanded(
                          flex: 2,
                          child: controller.mainController.detailsCard,
                        ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class Header extends GetView<MainController> {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
              onPressed: () {
                controller.scaffoldKey.currentState?.openDrawer();
              },
              icon: const Icon(Icons.menu)),
        Text("DashBoard ", style: Theme.of(context).textTheme.headline6),
        const Spacer(),
        const Expanded(child: TextFiledSearch()),
        const profileCard()
      ],
    );
  }
}
