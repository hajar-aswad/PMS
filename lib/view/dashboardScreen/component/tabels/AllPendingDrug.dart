import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pms/controller/screen/dashbaord_sreen_controller.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimentions.dart';
import '../../../../data/models/drugRequest.dart';

class AllPendingAddDrugRequestTable extends GetView<DashboardScreenController> {
  
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
            "All Add Drug Request",
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
              columns: [
                const DataColumn(label: Text("drug name")),
                const DataColumn(label: Text("note  and  description about drug ")),
                const DataColumn(label: Text("Date ")),
                 const DataColumn(label: Text("Staus")),
                  const DataColumn(label: Text("Sender ID ")),
              ],
              rows: List.generate(
                controller.DrugRequests.length,
                (index) => recentDataRow(context, controller.DrugRequests[index]),
              ),
            ),
          )
        ],
      ),
    );
  }
}

DataRow recentDataRow(BuildContext context, DrugRequest fileInfo) {
       DashboardScreenController dashboardScreenController = Get.find();

  return DataRow(cells: [
          DataCell(Text(fileInfo.drugName!)),
    DataCell(Text(fileInfo.notes!)),
    DataCell(Text(fileInfo.date!)),
    DataCell(Text(fileInfo.status!)),
    DataCell(Text(fileInfo.repositoryId!)),

  ],selected: false,
           onSelectChanged: (value) {
      if (value!) {
        _handleRowTap(context, fileInfo);
        
        dashboardScreenController.selectedId = fileInfo.id!;
        // dashboardScreenController.update();
      }
    });
}

void _handleRowTap(BuildContext context, DrugRequest fileInfo) {

  showDialog(
     barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        
        title: const Text( ' Add Drug request :'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Drug  name : " ,style: TextStyle(color: Colors.white54 , fontSize: 12))
            ,Text( '${fileInfo.drugName}'),
         const Text("Decsription  and note about drug : " ,style: TextStyle(color: Colors.white54 , fontSize: 12))
           , Text(' ${fileInfo.notes}'),
            const Text("type of Date of send  " ,style: TextStyle(color: Colors.white54 , fontSize: 12))
         ,   Text('${fileInfo.date}'), 
         const Text("Staus of  the request  " ,style: TextStyle(color: Colors.white54 , fontSize: 12))
         ,   Text('${fileInfo.status}'), 
          const Text("Sender Id" ,style: TextStyle(color: Colors.white54 , fontSize: 12))
         ,   Text('${fileInfo.repositoryId}'),
          ],
        ),
        actions: [ 
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
                  onPressed: () async {
                    DashboardScreenController dashboardScreenController = Get.find();

                    await dashboardScreenController.rejectDrugRequests();
Navigator.pop(context, 'accept');
                },
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Reject', style: TextStyle(color: Colors.white)),
            ),
          ), 
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
                  onPressed: () async {
                    DashboardScreenController dashboardScreenController = Get.find();

                    await dashboardScreenController.acceptDrugRequests(); 
             Navigator.pop(context, 'accept');
                },
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('Accept ', style: TextStyle(color: Colors.white)),
            ),
          ), 
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
                  onPressed: () async {
                    DashboardScreenController dashboardScreenController = Get.find();

                    await dashboardScreenController.archivedDrugRequests();
Navigator.pop(context, 'accept');
                },
              style: TextButton.styleFrom(backgroundColor: Colors.amber),
              child: const Text('Archive', style: TextStyle(color: Colors.white)),
            ),
          ), 
        ],
      );
    },
  );
}
