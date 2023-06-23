import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Text buildText(
  String? text, {
  Color? textColor,
  double? fontSize = 16,
  FontWeight? fontWeight = FontWeight.bold,
}) {
  return Text(
    text!,
    style: GoogleFonts.adventPro(
      textStyle: TextStyle(
        fontSize: fontSize!.sp,
        fontWeight: fontWeight,
        color: textColor,
      ),
    ),
  );
}

Text buildTextTitle(
  String? text, {
  Color? textColor,
  double? fontSize = 18,
  FontWeight? fontWeight = FontWeight.bold,
}) {
  return Text(
    text!,
    style: GoogleFonts.adventPro(
      textStyle: TextStyle(
        fontSize: fontSize!.sp,
        fontWeight: fontWeight,
        color: textColor,
      ),
    ),
  );
}
