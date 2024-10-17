import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pms/controller/screen/dashbaord_sreen_controller.dart';
import 'package:pms/data/models/drug.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimentions.dart';

class DosageFormTable extends GetView<DashboardScreenController> {
  const DosageFormTable({super.key});

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
            "All Dosage Form",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                horizontalMargin: 0,
                columnSpacing: AppDimentions.defaultPadding,
                onSelectAll: null,
                checkboxHorizontalMargin: 1,
                showCheckboxColumn: false,
                columns: const [
                  DataColumn(label: Text("name")),
                     DataColumn(label: Text("unit")),
                        DataColumn(label: Text("type")),
                          DataColumn(label: Text("")),

                ],
                rows: List.generate(
                  controller.dosageform.length,
                  (index) =>
                      recentDataRow(context, controller.dosageform[index]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

DataRow recentDataRow(BuildContext context, DosageForm dosageform) {
  DashboardScreenController dashboardScreenController = Get.find();

  return DataRow(
    cells: [
      DataCell(Text(dosageform.name!)),
       DataCell(Text(dosageform.type!)),
        DataCell(Text(dosageform.unit!)),
               DataCell(IconButton(onPressed: () async {

                    
                    await dashboardScreenController.deleteDosageForm();
                  
                }, icon:  Icon( Icons.delete_forever ,
                    color: Colors.red ),)),

    ],
    onSelectChanged: (value) {
      if (value!) {
        dashboardScreenController.updatenameController.text = dosageform.name!;
         dashboardScreenController.updatunitController.text = dosageform.unit!;
          dashboardScreenController.updattypeController.text = dosageform.type!;
        dashboardScreenController.selectedId = dosageform.id!;
        // dashboardScreenController.update();
      }
    },
  );
}

String mapEnumToString<T>(T enumValue) {
  return enumValue.toString().split('.').last;
}
