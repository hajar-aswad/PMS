import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pms/controller/screen/dashbaord_sreen_controller.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimentions.dart';


class CategoriesRight extends GetView<DashboardScreenController> {
  const CategoriesRight({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimentions.defaultPadding),
      decoration: const BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Create Category' ,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: AppDimentions.defaultPadding),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    controller: controller.newCategoryController,
                    decoration: const InputDecoration(
                      hintText: "Name",
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(controller.isCreateMode ? Icons.add : Icons.add ,
                    color: Colors.white),
                onPressed: () async {
               
                    await controller.createCategory();
                  
                },
              ),
            ],
          ),

          const SizedBox(height: AppDimentions.defaultPadding),
           const Text(
            'update Category' ,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: AppDimentions.defaultPadding),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    controller: controller.updateCategoryController,
                    decoration: const InputDecoration(
                      hintText: "Name",
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(controller.isCreateMode ? Icons.edit : Icons.edit  ,
                    color: Colors.blue ),
                onPressed: () async {
               
                    await controller.updateCategory();
                  
                },
              ),
            ],
            
          ),
                               const SizedBox(height: AppDimentions.defaultPadding),

           const Text(
            'Delete Category' ,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
                     const SizedBox(height: AppDimentions.defaultPadding),

          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    controller: controller.updateCategoryController,
                    decoration: const InputDecoration(
                      hintText: "Name",
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(controller.isCreateMode ? Icons.delete_forever : Icons.delete_forever  ,
                    color: Colors.red ),
                onPressed: () async {
               
                    await controller.deleteCategory();
                  
                },
              ),
            ],
            
          ),
        ],


      ),
    );
  }
}
