import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pms/controller/screen/dashbaord_sreen_controller.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimentions.dart';

class DosageFormRight extends GetView<DashboardScreenController> {
  const DosageFormRight({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimentions.defaultPadding),
      decoration: const BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add DosageForm' ,
                style: TextStyle( 
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),          const SizedBox(height: AppDimentions.defaultPadding),

              Text(
                'Name' ,
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
                        controller: controller.newnameController,
                        decoration: const InputDecoration(
                          hintText: "name",
                        ),
                      ),
                    ),
                  ),

                ],
              ),

              const SizedBox(height: AppDimentions.defaultPadding),
               const Text(
                ' Unit ' ,
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
                        controller: controller.unitController,
                        decoration: const InputDecoration(
                          hintText: "unit",
                        ),
                      ),
                    ),
                  ),

                ],
                
              ),
                                   const SizedBox(height: AppDimentions.defaultPadding),

               const Text(
                'Type' ,
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
                        controller: controller.typeController,
                        decoration: const InputDecoration(
                          hintText: "type",
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(controller.isCreateMode ? Icons.add : Icons.add  ,
                        color: Colors.white ),
                    onPressed: () async {
                   
                        await controller.createDosageForm();
                      
                    },
                  ),
                ],
                
              ),
            ],


          ), 
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
                                   const SizedBox(height: AppDimentions.defaultPadding),

          const Text(
            'Update or Delete DosageForm' ,
            style: TextStyle( 
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),          const SizedBox(height: AppDimentions.defaultPadding),

          Text(
            'Name' ,
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
                    controller: controller.updatenameController,
                    decoration: const InputDecoration(
                      hintText: "name",
                    ),
                  ),
                ),
              ),

            ],
          ),

          const SizedBox(height: AppDimentions.defaultPadding),
           const Text(
            ' Unit ' ,
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
                    controller: controller.updatunitController,
                    decoration: const InputDecoration(
                      hintText: "unit",
                    ),
                  ),
                ),
              ),

            ],
            
          ),
                               const SizedBox(height: AppDimentions.defaultPadding),

           const Text(
            'Type' ,
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
                    controller: controller.updattypeController,
                    decoration: const InputDecoration(
                      hintText: "type",
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(controller.isCreateMode ? Icons.edit : Icons.edit  ,
                    color: Colors.blue ),
                onPressed: () async {
               
                    await controller.updateDosageForm();
                  
                },
              ),
              //  IconButton(
              //   icon: Icon(controller.isCreateMode ? Icons.delete_forever : Icons.delete_forever  ,
              //       color: Colors.red ),
              //   onPressed: () async {
               
              //       await controller.deleteDosageForm();
                  
              //   },
              // ),
            ],
            
          ),
        ],


      ),
        ],
      ),
    );
  }
}
