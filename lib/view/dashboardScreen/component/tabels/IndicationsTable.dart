import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pms/controller/screen/dashbaord_sreen_controller.dart';
import 'package:pms/data/models/drug.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimentions.dart';

class IndicationsTable extends GetView<DashboardScreenController> {
  const IndicationsTable({super.key});

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
            "All Indications",
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
                ],
                rows: List.generate(
                  controller.categories.length,
                  (index) =>
                      recentDataRow(context, controller.categories[index]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

DataRow recentDataRow(BuildContext context, Category category) {
  DashboardScreenController dashboardScreenController = Get.find();

  return DataRow(
    cells: [
      DataCell(Text(category.name!)),
    ],
    onSelectChanged: (value) {
      if (value!) {
        dashboardScreenController.updateCategoryController.text = category.name!;
        
        dashboardScreenController.selectedId = category.id!;
        // dashboardScreenController.update();
      }
    },
  );
}

String mapEnumToString<T>(T enumValue) {
  return enumValue.toString().split('.').last;
}
