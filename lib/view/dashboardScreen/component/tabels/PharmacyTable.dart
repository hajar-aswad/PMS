import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pms/controller/screen/dashbaord_sreen_controller.dart';
import 'package:pms/data/models/pharmacy.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimentions.dart';

class PharmacyTable extends GetView<DashboardScreenController> {
  
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
            "All Pharmacies  rigesterd in application ",
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
                const DataColumn(label: Text(" Name ")),
                const DataColumn(label: Text("Phone Number ")),
                const DataColumn(label: Text("Address")),

              ],
              rows: List.generate(
                controller.pharmacy.length,
                (index) => recentDataRow(context, controller.pharmacy[index]),
              ),
            ),
          )
        ],
      ),
    );
  }
}

DataRow recentDataRow(BuildContext context, Pharmacy fileInfo) {
  return DataRow(cells: [
    DataCell(Text(fileInfo.name!)),
    DataCell(Text(fileInfo.phoneNumber!)),
    DataCell(Text(fileInfo.address!)),
   

  ],selected: false,
   onSelectChanged: (bool? selected) {
//     if (selected != null && selected)
//  // _handleRowTap(context, fileInfo);
//   });
});}
