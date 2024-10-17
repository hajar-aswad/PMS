import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pms/controller/screen/dashbaord_sreen_controller.dart';
import 'package:pms/core/constants/app_pages_routes.dart';

class SideMenu extends GetView<DashboardScreenController> {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset('assets/images/image1.png'),
            ),
            DrawerListTile(
              title: "Home",
              svgSrc: "assets/icons/1970469-ffffff.svg",
              press: () async {
                    await controller.getAllRegistrationRequestsPending();
                  },
                  onMenuItemSelected:
                      controller.mainController.changeSelectedMenuItem,
                ),
            ExpansionTile(
              leading: SvgPicture.asset(
                "assets/icons/2022409-00bcd4.svg",
                color: Colors.white54,
                height: 20,
              ),
              title: const Text(
                "Register Requests",
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
              trailing: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white54,
              ),
              children: [
                DrawerListTile(
                  title: "All Register Requests",
                  svgSrc: "assets/icons/744404-ff9800.svg",
                  press: () async {
                    await controller.getAllRegistrationRequests();
                  },
                  onMenuItemSelected:
                      controller.mainController.changeSelectedMenuItem,
                ),
                DrawerListTile(
                  title: "Pending",
                  svgSrc: "assets/icons/744404-ff9800.svg",
                  press: () async {
                    await controller.getAllRegistrationRequestsPending();
                  },
                  onMenuItemSelected:
                      controller.mainController.changeSelectedMenuItem,
                ),
                DrawerListTile(
                  title: "Accepted",
                  svgSrc: "assets/icons/744404-ff9800.svg",
                  press:  () async {
                    await controller.getAllRegistrationRequestsAccepting();
                  },
                  onMenuItemSelected:
                      controller.mainController.changeSelectedMenuItem,
                ),
                DrawerListTile(
                  title: "Rejected",
                  svgSrc: "assets/icons/744404-ff9800.svg",
                  press: () async {
                    await controller.getAllRegistrationRequestsRejecting();
                  },
                  onMenuItemSelected:
                      controller.mainController.changeSelectedMenuItem,
                ),
                DrawerListTile(
                  title: "Archived",
                  svgSrc: "assets/icons/744404-ff9800.svg",
                  press: () async {
                    await controller.getAllRegistrationRequestsArchived();
                  },
                  onMenuItemSelected:
                      controller.mainController.changeSelectedMenuItem,
                ),
              ],
            ),
            ExpansionTile(
              leading: SvgPicture.asset(
                "assets/icons/1294131-00bcd4.svg",
                color: Colors.white54,
                height: 20,
              ),
              title: const Text(
                "Classifications",
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
              trailing: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white54,
              ),
              children: [
                DrawerListTile(
                  title: "Categories",
                  svgSrc: "assets/icons/744404-ff9800.svg",
                  press: () async {
                    await controller.getAllCategories();
                  },
                  onMenuItemSelected:
                      controller.mainController.changeSelectedMenuItem,
                ),
                DrawerListTile(
                  title: "Manufacture Companies",
                  svgSrc: "assets/icons/744404-ff9800.svg",
                  press:  () async {
                    await controller.getAllManufactureCompany();
                  },
                  onMenuItemSelected:
                      controller.mainController.changeSelectedMenuItem,
                ),
                DrawerListTile(
                  title: "Dosage Forms",
                  svgSrc: "assets/icons/744404-ff9800.svg",
                  press:  () async {
                    await controller.getAllDosageForm();
                  },
                  onMenuItemSelected:
                      controller.mainController.changeSelectedMenuItem,
                ),
                DrawerListTile(
                  title: "Scientific Materials",
                  svgSrc: "assets/icons/744404-ff9800.svg",
                  press:  () async {
                    await controller.getAllScientificMaterial();
                  },
                  onMenuItemSelected:
                      controller.mainController.changeSelectedMenuItem,
                ),
                DrawerListTile(
                  title: "Indications",
                  svgSrc: "assets/icons/744404-ff9800.svg",
                  press:  () async {
                    await controller.getAllIndication();
                  },
                  onMenuItemSelected:
                      controller.mainController.changeSelectedMenuItem,
                ),
                DrawerListTile(
                  title: "Therapeutic Effects",
                  svgSrc: "assets/icons/744404-ff9800.svg",
                  press:  () async {
                    await controller.getAllTherapeuticEffects();
                  },
                  onMenuItemSelected:
                      controller.mainController.changeSelectedMenuItem,
                ),
              ],
            ),
            ExpansionTile(
              leading: SvgPicture.asset(
                "assets/icons/951505-ffffff.svg",
                color: Colors.white54,
                height: 20,
              ),
              title: const Text(
                "Adding A drug Requests",
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
              trailing: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white54,
              ),
              children: [
                DrawerListTile(
                  title: "All Adding A drug Requests",
                  svgSrc: "assets/icons/744404-ff9800.svg",
                  press:  () async {
                    await controller.getAllDrugRequests();
                  },
                  onMenuItemSelected:
                      controller.mainController.changeSelectedMenuItem,
                ),
                DrawerListTile(
                  title: " Archived",
                  svgSrc: "assets/icons/744404-ff9800.svg",
                  press:  () async {
                    await controller.getAllDrugRequestsArchived();
                  },
                  onMenuItemSelected:
                      controller.mainController.changeSelectedMenuItem,
                ),
                DrawerListTile(
                  title: " Pending",
                  svgSrc: "assets/icons/744404-ff9800.svg",
                  press: () async {
                    await controller.getAllDrugRequestsPending();
                  },
                  onMenuItemSelected:
                      controller.mainController.changeSelectedMenuItem,
                ),
                DrawerListTile(
                  title: " Accepted",
                  svgSrc: "assets/icons/744404-ff9800.svg",
                  press: () async {
                    await controller.getAllDrugRequestsAccepting();
                  },
                  onMenuItemSelected:
                      controller.mainController.changeSelectedMenuItem,
                ),
                DrawerListTile(
                  title: " Rejected",
                  svgSrc: "assets/icons/744404-ff9800.svg",
                  press:() async {
                    await controller.getAllDrugRequestsRejecting();
                  },
                  onMenuItemSelected:
                      controller.mainController.changeSelectedMenuItem,
                ),
              ],
            ),
            DrawerListTile(
              title: "All Drugs",
              svgSrc: "assets/icons/41190-ffffff.svg",
              press:() async {
                    await controller.getAllDrugs();
                  },
                  onMenuItemSelected:
                      controller.mainController.changeSelectedMenuItem,
                ),
            DrawerListTile(
              title: "Pharmacists",
              svgSrc: "assets/icons/34904.svg",
              press:() async {
                    await controller.getAllpharmacies();
                  },
                  onMenuItemSelected:
                      controller.mainController.changeSelectedMenuItem,
                ),

            DrawerListTile(
              title: "  Suppliers",
              svgSrc: "assets/icons/1918551-ffffff.svg",
             press:() async {
                    await controller.getAllrepositories();
                  },
                  onMenuItemSelected:
                      controller.mainController.changeSelectedMenuItem,
                ),
            DrawerListTile(
              title: "Log out",
              svgSrc: "assets/icons/logout-svgrepo-com.svg",
              press: () {
                Get.offAllNamed(AppPagesRoutes.loginScreen);
              },
              onMenuItemSelected:
                  controller.mainController.changeSelectedMenuItem,
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.svgSrc,
    required this.press,
    required this.onMenuItemSelected,
  });

  final String title, svgSrc;
  final VoidCallback press;

  final Function(String) onMenuItemSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        press.call();
        onMenuItemSelected(title);
      },
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 20,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54, fontSize: 12),
      ),
    );
  }
}
