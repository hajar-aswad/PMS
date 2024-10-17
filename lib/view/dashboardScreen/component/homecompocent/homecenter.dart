 import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pms/controller/screen/dashbaord_sreen_controller.dart';
import 'package:pms/core/constants/app_dimentions.dart';
import 'package:pms/data/models/CloudStorageInfo.dart';
import 'package:pms/view/dashboardScreen/component/homecompocent/shortcuts.dart';
import 'package:pms/view/dashboardScreen/component/tabels/AllRegisterRequestTable.dart';
import '../../../main_screen/widget/responsive.dart'; 

   class HomeCenter extends GetView<DashboardScreenController> {
  const HomeCenter({super.key, });
  @override
  Widget build(BuildContext context) {
 final Size _size =MediaQuery.of(context).size;
    return Column(
        children: [
          const SizedBox(
            height: AppDimentions.defaultPadding,),
           Responsive(mobile: centergridview(crossAxisCount: _size.width<650?2:4,
           childAspectRatio:  _size.width<650?1.3:1 ,
           ),
               tablet: const centergridview(),
                desktop: centergridview(childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,)) ,
///////////////////////////////////


             const SizedBox(height: AppDimentions.defaultPadding,), 
             const AllRegisterRequestTable()
          
        ],
      );
  } 
   }

class centergridview extends StatelessWidget {
  const centergridview({
    super.key, this.crossAxisCount =4, this.childAspectRatio =1,
  });
 final int  crossAxisCount;
 final  double  childAspectRatio;
  @override
  Widget build(BuildContext context) {
  
     return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
     itemCount: demoMyFiles.length,
     shrinkWrap: true,
     gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
     crossAxisCount: crossAxisCount ,
     crossAxisSpacing: AppDimentions.defaultPadding,
     mainAxisSpacing: AppDimentions.defaultPadding,
     childAspectRatio:childAspectRatio,
      ),
     itemBuilder: (context, index )=> ShortcutInfoCrd( info: demoMyFiles[index],),
     );
  }
}