import 'package:flutter/material.dart';
import 'package:pms/core/constants/app_colors.dart';

import '../../../../core/constants/app_dimentions.dart';
import '../../../../data/models/pharmacy.dart';

class SupplierTable extends StatelessWidget {
  const SupplierTable({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Pharmacy> dummyPharmacies=[];
    return Container(
      padding: const EdgeInsets.all(AppDimentions.defaultPadding),
      decoration: const BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
          "All Supplier",
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
                const DataColumn(label: Text("Supplier name")),
                const DataColumn(label: Text("Phone number")),
                const DataColumn(label: Text("Addres")),
              ],
              rows: List.generate(
                dummyPharmacies.length,
                (index) => recentDataRow(context, dummyPharmacies[index]),
              ),
            ),
          )
        ],
      ),
    );
  }
}

DataRow recentDataRow(BuildContext context,   Pharmacy fileInfo) {
  return DataRow(cells: [
    DataCell(Text(fileInfo.name!)),
    DataCell(Text(fileInfo.phoneNumber!)),
    DataCell(Text(fileInfo.address!)),
  ],selected: false,
   onSelectChanged: (bool? selected) {
    if (selected != null && selected) {
      _handleRowTap(context, fileInfo);
    }
  });
}

     void _handleRowTap(BuildContext context, Pharmacy fileInfo) {
 
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Row Tapped'),
        content: Text('You tapped on: ${fileInfo.name}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}