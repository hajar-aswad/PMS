import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimentions.dart';


class Accepted extends StatelessWidget {

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
    const Text("Select an item to see  Accepted  pharmacyes and  supplier rigisterd  on the application ", style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,

    ),),
    const SizedBox(height: AppDimentions.defaultPadding,),
    
     Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
           Center(child: SvgPicture.asset('assets/icons/acc.svg',color: Colors.white54, height:120, )),

          ],
        ),
        
        ],
                 
               ),
              );
  }
}