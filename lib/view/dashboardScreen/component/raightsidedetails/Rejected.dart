import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimentions.dart';


class Rejected extends StatelessWidget {

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
    const Text("Select an item to see rejected pharmacyes and  supplier and  thier  false  restration paper ", style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,

    ),),
    const SizedBox(height: AppDimentions.defaultPadding,),
    
     Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
           SvgPicture.asset('assets/icons/6.svg',color: Colors.white54, height:230, ),

          ],
        ),
        
        ],
                 
               ),
              );
  }
}
