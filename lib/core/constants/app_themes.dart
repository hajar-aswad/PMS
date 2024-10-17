import 'package:flutter/material.dart';
import 'package:pms/core/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppThemes {

  static ThemeData themeEnglish = ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.bgColor,
        textTheme: GoogleFonts.poppinsTextTheme()
            .apply(bodyColor: Colors.white),
        canvasColor: AppColors.secondaryColor,
      );
  
}
