
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimentions.dart';

class chartdetails extends StatelessWidget {
  const chartdetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child:  Stack(
        children: [
          
          PieChart(PieChartData(
            startDegreeOffset: -90,
            sectionsSpace: 0,
            centerSpaceRadius: 70,
            sections: PieCharSeletionData,
          )),
          Positioned.fill(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: AppDimentions.defaultPadding,),
              Text("30", style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.white, 
              fontWeight: FontWeight.w600,
              height: 0.5,
              ),),
              const Text("of all 160 ph")
            ],
          ))
        ],
      ),
    );
  }
}

 List<PieChartSectionData> PieCharSeletionData= [
                        PieChartSectionData(
                          value: 15,
                          color: AppColors.primaryColor,
                          showTitle: false,
                          radius: 25,

                        ),
                         PieChartSectionData(
                          value: 20,
                          color: const Color(0xff26e5ff),
                          showTitle: false,
                          radius: 22,

                        ),
                         PieChartSectionData(
                          value: 10,
                          color: const Color(0xffffcf26),
                          showTitle: false,
                          radius: 19,

                        ),
                         PieChartSectionData(
                          value: 15,
                          color: const Color(0xffee2727),
                          showTitle: false,
                          radius: 16,

                        ),
                         PieChartSectionData(
                          value: 15,
                          color: AppColors.primaryColor.withOpacity(0.1),
                          showTitle: false,
                          radius: 13,

                        ), 
                      ];