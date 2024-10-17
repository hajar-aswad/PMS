import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pms/controller/screen/dashbaord_sreen_controller.dart';
import 'package:pms/view/dashboardScreen/component/addingdialogs/AddDrugDialog.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimentions.dart';
import '../../../../data/models/CloudStorageInfo.dart';
import '../addingdialogs/AddIndications.dart';
import '../addingdialogs/AddScientificMaterials.dart';
import '../addingdialogs/AddTherapeuticEffect.dart';

class ShortcutInfoCrd extends  GetView<DashboardScreenController> {
  const ShortcutInfoCrd({
    super.key, required this.info,
  });

final CloudStorageInfo info;
  @override
  Widget build(BuildContext context) {
    return Container(
     padding: const EdgeInsets.all(AppDimentions.defaultPadding),
     decoration: const BoxDecoration(
       color: AppColors.secondaryColor,
       borderRadius: BorderRadius.all(Radius.circular(10))
     ),
     child: Column(
       children: [
         Row(
           children: [
             Container(
              padding: const EdgeInsets.all(AppDimentions.defaultPadding*0.75),
               height: 40,
               width: 40,
               decoration: BoxDecoration(
                 color: info.color?.withOpacity(0.1),
                 borderRadius: const BorderRadius.all(Radius.circular(10)),
               ),
               child: SvgPicture.asset(
                info.svgSrc.toString(),
                color: info.color,

               ),
             ),const SizedBox(width: AppDimentions.defaultPadding)
           ],
         )
           , Expanded(
             child: FittedBox(
                      fit: BoxFit.scaleDown,
               child: Text(info.title.toString(),
                 maxLines: 2,
                // overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16, )
               ),
             ),
           ),
            
           const Spacer(),
           Container(
          alignment: Alignment.bottomCenter,
            height: 30, 
            width:double.infinity,
             child: ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal:AppDimentions.defaultPadding*1.5,
                  vertical: AppDimentions.defaultPadding*0.5,
                )
              ),
              onPressed: ()=>{
                            _showAddNewDialog(context, info.title.toString())

              }, 
             icon: const Icon(Icons.add),
              label: const FittedBox( 
                  fit: BoxFit.scaleDown,
                child: Text("Add new"
                 ,style: TextStyle(fontSize: 16),
                ),
              )),
           )
       ],
     ),
    );
  }
}

void _showAddNewDialog(BuildContext context, String cardTitle) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      if (cardTitle == 'Add Manufactor company') {
       return AddDrugDialog();
      }
      if (cardTitle == 'Add Indications') {
        return AddIndicattions();
      } 
      if (cardTitle == ' Add Therapeutic Effects') {
        return AddTherapeuticEffect();
      } 
      if (cardTitle == 'Add Scientific Materials') {
        return AddScientificMaterials();
      } 
      return const AlertDialog(
      );
    },
  );
}
