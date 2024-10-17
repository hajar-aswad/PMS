import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pms/controller/screen/dashbaord_sreen_controller.dart';
import 'package:pms/data/models/drug.dart';
import 'package:pms/view/widget/handle_request.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimentions.dart';

class ManufactureCompaniesTable extends GetView<DashboardScreenController> {
  const ManufactureCompaniesTable({super.key});

  @override
  Widget build(BuildContext context) {
    return   GetBuilder<DashboardScreenController>(
      builder: (controller) => HandleRequest(
        statusView: controller.statusView,
   child: Container(
      padding: const EdgeInsets.all(AppDimentions.defaultPadding),
      decoration: const BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "All Manufacture Companies",
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
                  controller.manufactor.length,
                  (index) =>
                      recentDataRow(context, controller.manufactor[index]),
                ),
              ),
            ),
          )
        ],
      ),
    ),
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
      }
    },
  );
}

String mapEnumToString<T>(T enumValue) {
  return enumValue.toString().split('.').last;
}
