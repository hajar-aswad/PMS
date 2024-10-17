import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimentions.dart';
import 'chart.dart';
import 'details.dart';

class details_card extends StatefulWidget {


  @override
  State<details_card> createState() => _details_cardState();
}

class _details_cardState extends State<details_card> {
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
    const Text("Details", style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,

    ),),
    const SizedBox(height: AppDimentions.defaultPadding,),
    const chartdetails(),
    const detailsCard(svgscr: "assets/icons/744404-ff9800.svg",
     title: "pharmacies",
     colour:  Color(0xff26e5ff),
     amoutof: "13",
     numberof: 23,),
     const detailsCard(svgscr: "assets/icons/744404-ff9800.svg",
     title: "Suppliers",
      colour:  Color(0xffffcf26),
     amoutof: " 10",
     numberof: 23,),
     const detailsCard(svgscr: "assets/icons/744404-ff9800.svg",
      colour: Color(0xffee2727),
     title: "Drugs",
     amoutof: "13 ",
     numberof: 23,) ,
     const detailsCard(svgscr: "assets/icons/744404-ff9800.svg",
     title: "Register request",
      colour: AppColors.primaryColor,
     amoutof: "11",
     numberof: 23,),
     detailsCard(svgscr: "assets/icons/744404-ff9800.svg",
     title: "drug Adding",
      colour: AppColors.primaryColor.withOpacity(0.1),
     amoutof: "14 ",
     numberof: 23,)
                 ],
               ),
              );
  }
}
