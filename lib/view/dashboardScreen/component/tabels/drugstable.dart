import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimentions.dart';
import '../../../../data/models/drug.dart';

import 'package:get/get.dart';
import 'package:pms/controller/screen/dashbaord_sreen_controller.dart';
import 'package:pms/view/widget/handle_request.dart';


class DrugTable extends GetView<DashboardScreenController> {
  const DrugTable({super.key});

  @override
  Widget build(BuildContext context) {
    return   GetBuilder<DashboardScreenController>(
      builder: (controller) => HandleRequest(
        statusView: controller.statusView,
   child: Container(
       padding:  EdgeInsets.all(AppDimentions.defaultPadding),
      decoration:  BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "All Drugs",
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
                columns: [
                  const DataColumn(label: Text("brand name")),
                  const DataColumn(label: Text("scientific_name")),
                  const DataColumn(label: Text("capacity")),
                  const DataColumn(label: Text("titer")),
                  const DataColumn(label: Text("contraindications")),
                  const DataColumn(label: Text("side effects")),
                  const DataColumn(label: Text("prescription")),
                  const DataColumn(label: Text("doesage form")),
                  const DataColumn(label: Text("category")),
                    const DataColumn(label: Text("manufacture company")),
                    const DataColumn(label: Text("scientific materials")),
                    const DataColumn(label: Text("therapeutic effects")),
                    const DataColumn(label: Text("indications")),
                                       const DataColumn(label: Text("")),

                  
                ],
                rows: List.generate(
                   controller.drugs.length,
                  (index) => recentDataRow(context,  controller.drugs[index]),
                ),
              ),
            ),
          )
        ],
      ),
      ),
      )
      );
  }
}

DataRow recentDataRow(BuildContext context, Drug  fileInfo)  {
    DashboardScreenController dashboardScreenController = Get.find();

   return DataRow(cells: [
    DataCell(Text(fileInfo.brandName!)),
    DataCell(Text(fileInfo.scientificMaterials!.first.name!)),
    DataCell(Text(fileInfo.capacity!)),
      DataCell(Text(fileInfo.titer!)),
           DataCell(Text(fileInfo.contraindications!)),
                DataCell(Text(fileInfo.sideEffects!)),
                     DataCell(Text(fileInfo.isPrescription.toString())),
                      DataCell(Text(mapEnumToString(fileInfo.dosageForm?.name ??'').toString())),
                          DataCell(Text(mapEnumToString(fileInfo.category?.name ??'').toString())), 
                         DataCell(Text(mapEnumToString(fileInfo.manufactureCompany?.name ??'').toString())),
                             DataCell(Text(fileInfo.scientificMaterials?.map((category) => category.name).join(', ') ?? ''.toString())),
                                DataCell(Text(fileInfo.therapeuticEffects?.map((category) => category.name).join(', ') ?? ''.toString())),
                                  DataCell(Text(fileInfo.indications?.map((category) => category.name).join(', ') ?? ''.toString())),
                                       DataCell(IconButton(onPressed: () async {

                    
                    await dashboardScreenController.deleteDrug();
                  
                }, icon:  Icon( Icons.delete_forever ,
                    color: Colors.red ),)),

//
  ],selected: false,
   onSelectChanged: 
 (value) {
      if (value!) {
        // dashboardScreenController.updateCategoryController.text = category.name!;
        
        dashboardScreenController.selectedId = fileInfo.id!;
        // dashboardScreenController.update();
       }
    },
  );
}
// }

//      void _handleRowTap(BuildContext context, Drug fileInfo) {
 
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Row Tapped'),
//         content: Text('You tapped on: ${fileInfo.brand_name}'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text('OK'),
//           ),
//         ],
//       );
//     },
//   );
// }




 String mapEnumToString<T>(T enumValue) {
  return enumValue.toString().split('.').last;
}





//       padding: const EdgeInsetsdouble defaultPadding.all(AppDimentions.defaultPadding),
//       decoration: const BoxDecoration(
//           color: AppColors.secondaryColor,
//           borderRadius: BorderRadius.all(Radius.circular(10))),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "All Manufacture Companies",
//             style: Theme.of(context).textTheme.subtitle1,
//           ),
//           SizedBox(
//             width: double.infinity,
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: DataTable(
//                 horizontalMargin: 0,
//                 columnSpacing: AppDimentions.defaultPadding,
//                 onSelectAll: null,
//                 checkboxHorizontalMargin: 1,
//                 showCheckboxColumn: false,
//                 columns: const [
//                   DataColumn(label: Text("name")),
//                 ],
//                 rows: List.generate(
//                   controller.manufactor.length,
//                   (index) =>
//                       recentDataRow(context, controller.manufactor[index]),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     ),
//       ),
//     );
//   }
// }

// DataRow recentDataRow(BuildContext context, Category category) {
//   DashboardScreenController dashboardScreenController = Get.find();

//   return DataRow(
//     cells: [
//       DataCell(Text(category.name!)),
//     ],
//     onSelectChanged: (value) {
//       if (value!) {
//         dashboardScreenController.updateCategoryController.text = category.name!;
//         dashboardScreenController.selectedId = category.id!;
//       }
//     },
//   );
// }

// String mapEnumToString<T>(T enumValue) {
//   return enumValue.toString().split('.').last;
// }

 