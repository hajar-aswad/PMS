import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimentions.dart';

class detailsCard extends StatelessWidget {
  const detailsCard({
    super.key, 
    required this.title,
     required this.svgscr, 
     required this.amoutof, 
     required this.numberof,
      required this.colour, 
  });
 final String title,svgscr, amoutof;
 final int numberof;
 final Color colour;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppDimentions.defaultPadding),
      padding: const EdgeInsets.all(AppDimentions.defaultPadding), 
      decoration: BoxDecoration(
        border: Border.all(width: 2,color: AppColors.primaryColor.withOpacity(0.15),
        
        ),
         borderRadius:  const BorderRadius.all(Radius.circular(AppDimentions.defaultPadding)),


      ),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
             child:  SvgPicture.asset( svgscr, color:colour,), //"assets/icons/744404-ff9800.svg"
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimentions.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,maxLines: 1,//"connected pharmacies"
                overflow: TextOverflow.ellipsis
                ,)
                // ,Text("$numberof new one ", 
                //  style: Theme.of(context).textTheme.caption?.copyWith(color: Colors.white70),
                // )
              ],
          
                     
            ),
          ))
          ,Text(amoutof),
        ],
      ),
    );
  }
}
 

  