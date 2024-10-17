import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pms/core/constants/app_colors.dart';
import 'package:pms/core/constants/app_dimentions.dart';

import '../../main_screen/widget/responsive.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return Row(
      children: [

        if (!Responsive.isDesktop(context))
          IconButton(
            onPressed: () {
                            print("Opening drawer"); // Debugging print

              Scaffold.of(context).openDrawer(); // Open side menu drawer
            },
            icon: const Icon(Icons.menu),
          ),
       if(!Responsive.isMobile(context))  Text("DashBoard ",style: Theme.of(context).textTheme.headline6),
       if(!Responsive.isMobile(context)) Spacer( flex: Responsive.isDesktop(context)? 2:1,),
        Expanded(child: SvgPicture.asset("assets/icons/logout-svgrepo-com.svg",color: Colors.white54, height: 40, )),

        const Expanded(child: TextFiledSearch()),
      
        const profileCard(),
      
        ],
     
    );
  }
}

class profileCard extends StatelessWidget {
  const profileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container( 
      margin: const EdgeInsets.only(left:  AppDimentions.defaultPadding),
      padding: const EdgeInsets.symmetric(horizontal:  AppDimentions.defaultPadding, vertical:  AppDimentions.defaultPadding/2),
      decoration: BoxDecoration( color: AppColors.secondaryColor
      , borderRadius:  const BorderRadius.all(Radius.circular(10)),
      border: Border.all(color: Colors.white10)

      ),
      child: Row(
         children: [ 
          const SizedBox( width: 10,),
          Image.asset("assets/images/personn.jpg", height: 38,),
         if(!Responsive.isMobile(context)) const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimentions.defaultPadding/2),
            child: Text("esraa "),
          )
      ,
      const Icon(Icons.keyboard_arrow_down),
         ],
      ),
    );
  }
}

  
class TextFiledSearch extends StatelessWidget {
  const TextFiledSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField( decoration: InputDecoration(fillColor: AppColors.secondaryColor,
    hintText: "Search for anything ",
    filled: true,
    border: const OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.all(Radius.circular(10),),
    ),
    suffixIcon: InkWell(
      onTap: () {}, ////////////////////////////////////
      child: Container(  
        padding: const EdgeInsets.all(AppDimentions.defaultPadding*0.75),
      // margin: EdgeInsets.symmetric(horizontal: defaultPadding/2),
      decoration: const BoxDecoration(color: AppColors.primaryColor,  borderRadius: BorderRadius.all(Radius.circular(10),
      ),
      
                   
    
      ),
        child: SvgPicture.asset("assets/icons/1970475.svg",height: 30,color: Colors.white,),
      ),
    ),

    )
            );
  }
} 