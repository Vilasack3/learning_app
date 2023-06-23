import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/constant/colors.dart';

import 'text_widgets.dart';

Widget buildIconButton(
  String? text, {
  void Function()? onTap,
  required IconData? icon,
  Color? iconColor = Colors.white,
  Color? textColor = Colors.white,
  Color? buttonColor = AppColors.secondaryElement,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 115.w,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        color: buttonColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            offset: const Offset(0, 4),
            color: Colors.grey.shade400,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          SizedBox(width: 15.w),
          buildText(text),
        ],
      ),
    ),
  );
}

Widget buildButton(
  String? text, {
  void Function()? onTap,
  Color? iconColor = Colors.white,
  Color? textColor = Colors.white,
  Color? buttonColor = AppColors.secondaryElement,
  double? borderRadius = 5,
  double? width,
  BoxBorder? border,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      width: width,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius!.w),
        color: buttonColor,
        border: border,
      ),
      child: buildText(text),
    ),
  );
}
