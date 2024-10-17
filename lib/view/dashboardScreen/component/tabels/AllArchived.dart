import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pms/controller/screen/dashbaord_sreen_controller.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimentions.dart';
import 'package:pms/data/models/RegisterRequest.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AllArchivedgRegisterRequestTable extends GetView<DashboardScreenController> {
  const AllArchivedgRegisterRequestTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimentions.defaultPadding),
      decoration: const BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "All Register Request",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              horizontalMargin: 0,
              columnSpacing: AppDimentions.defaultPadding,
              onSelectAll: null,
              checkboxHorizontalMargin: 1,
              showCheckboxColumn: false,
              columns: const [
                DataColumn(label: Text("Name")),
                DataColumn(label: Text("Date")),
                DataColumn(label: Text("Type")),
                DataColumn(label: Text("STatus")),
              ],
              rows: List.generate(
                controller.registerRequests.length,
                (index) =>
                    recentDataRow(context, controller.registerRequests[index]),
              ),
            ),
          )
        ],
      ),
    );
  }
}

DataRow recentDataRow(BuildContext context, RegisterRequest fileInfo) {
   DashboardScreenController dashboardScreenController = Get.find();
  return DataRow(
      cells: [
        DataCell(Text(fileInfo.name!)),
        DataCell(Text(fileInfo.phoneNumber!)),
        DataCell(Text(fileInfo.type!)),
        DataCell(Text(fileInfo.status!)),
      ],
      selected: false,
        onSelectChanged: (value) {
      if (value!) {
        _handleRowTap(context, fileInfo);
        
        dashboardScreenController.selectedId = fileInfo.id!;
        // dashboardScreenController.update();
      }
    },
   
      );
}
void _handleRowTap(BuildContext context, RegisterRequest fileInfo) {

  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(' Register request :'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(" Name of sender : ",
                style: TextStyle(color: Colors.white54, fontSize: 12)),
            Text('${fileInfo.name}'),
            const Text("Phone number : ",
                style: TextStyle(color: Colors.white54, fontSize: 12)),
            Text(' ${fileInfo.phoneNumber}'),
            const Text("Staus of  the request  ",
                style: TextStyle(color: Colors.white54, fontSize: 12)),
            Text('${fileInfo.status}'),
            const Text("type of  sender ",
                style: TextStyle(color: Colors.white54, fontSize: 12)),
            Text('${fileInfo.type}'),
            const Text("image of  vertification paper :",
                style: TextStyle(color: Colors.white54, fontSize: 12)),
            const SizedBox(
              height: 10,
            ),
            Center(
                child: CachedNetworkImage(
              imageUrl: fileInfo.documentPhoto!,
              height: Get.height * 0.3,
              width: Get.height * 0.3,
            ))
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
                               onPressed: () async {
                    DashboardScreenController dashboardScreenController = Get.find();

                    await dashboardScreenController.deleteRegistrationRequests();
Navigator.pop(context, 'accept');
                },
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: Text('Delet forever ', style: TextStyle(color: Colors.white)),
            ),
          ),
           Padding(
             padding: const EdgeInsets.all(15.0),
             child: TextButton(
             
                  onPressed: () async {
                    DashboardScreenController dashboardScreenController = Get.find();

                    await dashboardScreenController.unarchivedRegistrationRequests();
Navigator.pop(context, 'accept');
                },
              style: TextButton.styleFrom(backgroundColor: Colors.amber),
              child: Text(' Un Archive', style: TextStyle(color: Colors.white)),
                     ),
           ),
         
        ],
      );
    },
  );
}
