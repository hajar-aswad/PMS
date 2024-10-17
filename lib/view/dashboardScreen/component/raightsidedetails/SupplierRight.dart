import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimentions.dart';

class SupplierRight extends StatefulWidget {

  @override
  State<SupplierRight> createState() => _SupplierState();
}

class _SupplierState extends State<SupplierRight> {
  @override 

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimentions.defaultPadding),
                 decoration: BoxDecoration(color: AppColors.secondaryColor, 
                borderRadius:  const BorderRadius.all(Radius.circular(10))

                ),

              child: 
              Column(
             crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
    Text("All  the  suppliers  already rigisterd ", style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,

    ),),
    SizedBox(height: AppDimentions.defaultPadding,),
    
     Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
           Center(child: SvgPicture.asset('assets/icons/38268-607d8b.svg',color: Colors.white54, height:170, )),

          ],
        ),
        
        ],
                 
               ),
              );
  }
}
