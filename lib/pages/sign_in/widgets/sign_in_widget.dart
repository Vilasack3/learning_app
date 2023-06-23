import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_app/common/constant/colors.dart';
import 'package:lottie/lottie.dart';

AppBar buildAppBar({required String? title}) {
  return AppBar(
    elevation: 0,
    backgroundColor: AppColors.primaryBackground,
    title: Text(
      title!,
      style: GoogleFonts.adventPro(
        textStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    ),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        //height defines the thickness of the lin
        height: 0.5,
        color: Colors.black12,
      ),
    ),
  );
}

//It needs context for accessing bloc
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(
      top: 40.h,
      bottom: 20.h,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        reusableIcon(
            "https://assets1.lottiefiles.com/private_files/lf30_29gwi53x.json"),
        reusableIcon(
            "https://assets4.lottiefiles.com/private_files/lf30_up3nxxtl.json"),
        reusableIcon(
            "https://assets7.lottiefiles.com/private_files/lf30_pb3we3yk.json"),
      ],
    ),
  );
}

Widget reusableIcon(String iconPath) {
  return GestureDetector(
    onTap: () {
      //TODO
    },
    child: CircleAvatar(
      backgroundColor: Colors.black12,
      radius: 20.w,
      // height: 40.w,
      child: Lottie.network(iconPath),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: GoogleFonts.adventPro(
        textStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget buildTextField({
  String? hintText,
  String? textType,
  IconData? icon,
  void Function(String value)? onChange,
}) {
  return Container(
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15.w)),
      border: Border.all(color: Colors.grey),
      boxShadow: [
        BoxShadow(
          blurRadius: 5,
          offset: const Offset(0, 5),
          color: Colors.black.withOpacity(0.2),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 270.w,
          height: 35.h,
          child: TextField(
            onChanged: (value) => onChange!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              prefixIcon: Icon(
                icon,
                color: Colors.black,
                size: 25.w,
              ),
            ),
            obscureText: textType == "password" ? true : false,
            style: GoogleFonts.adventPro(
              textStyle: TextStyle(
                fontSize: 16.sp,
                color: AppColors.primaryText,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget forgotPassword() {
  return SizedBox(
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Forgot password",
        style: GoogleFonts.adventPro(
          textStyle: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    ),
  );
}

Widget buildLoginAndRegisterButton({
  String? textButton,
  String? buttonType,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(top: buttonType == "login" ? 40.h : 20.h),
      alignment: Alignment.center,
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        color: buttonType == "login" ? Colors.black87 : Colors.transparent,
        border: Border.all(color: Colors.grey),
        boxShadow: buttonType == "login"
            ? [
                BoxShadow(
                  blurRadius: 8,
                  offset: const Offset(0, 8),
                  color: Colors.black.withOpacity(0.2),
                ),
              ]
            : null,
      ),
      child: Text(
        textButton!,
        style: GoogleFonts.adventPro(
          textStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: buttonType == "login"
                ? AppColors.secondaryText
                : AppColors.primaryText,
          ),
        ),
      ),
    ),
  );
}
