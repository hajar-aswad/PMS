import 'package:flutter/material.dart';
class CloudStorageInfo {
  final String? svgSrc, title;
  
  final Color? color;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
  
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Add Manufactor company",
    svgSrc: "assets/icons/drugs-medicine-pills-svgrepo-com.svg",
   
    color: Color(0xFFA4CDFF),
  ),
  CloudStorageInfo(
    title: "Add Indications",
    svgSrc: "assets/icons/prescription-svgrepo-com.svg",
   
    color:Color(0xFFA4CDFF),
  ),
  CloudStorageInfo(
    title: " Add Therapeutic Effects",
    svgSrc: "assets/icons/effects-svgrepo-com.svg",
   
    color:Color(0xFFA4CDFF),
  ),
  CloudStorageInfo(
    title: "Add Scientific Materials",
    svgSrc: "assets/icons/3.svg",
    color: Color(0xFFA4CDFF),
   
  ),
];
