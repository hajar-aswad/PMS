import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimentions.dart';

class AllDrugRequest extends StatelessWidget {

  @override 

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimentions.defaultPadding),
                 decoration: const BoxDecoration(color: AppColors.secondaryColor, 
                borderRadius:  BorderRadius.all(Radius.circular(10))

                ),

              child: 
              Column(
             crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
    const Text("All Drug Request due to thier Status ", style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,

    ),),
    const SizedBox(height: AppDimentions.defaultPadding,),
    
     Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
           Center(child: SvgPicture.asset('assets/icons/2.svg',color: Colors.white54, height:170, )),

          ],
        ),
        
        ],
                 
               ),
              );
  }
}
