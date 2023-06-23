import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_app/common/constant/colors.dart';
import 'package:learning_app/common/routes/names.dart';
import 'package:lottie/lottie.dart';

AppBar profileAppBar() {
  return AppBar(
    backgroundColor: AppColors.primaryBackground,
    elevation: 6,
    shadowColor: Colors.black.withOpacity(.3),
    leading: const Icon(Icons.sort),
    title: Text(
      "Profile",
      style: GoogleFonts.adventPro(
        textStyle: TextStyle(
          color: AppColors.primaryText,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: Icon(Icons.more_vert),
      ),
    ],
  );
}

Widget profileWidget() {
  return Padding(
    padding: EdgeInsets.only(top: 10.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 80.w,
          height: 80.h,
          child: Lottie.network(
            "https://assets6.lottiefiles.com/datafiles/6deVuMSwjYosId3/data.json",
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: Text(
            "Peopi",
            style: GoogleFonts.adventPro(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

var listInfo = <String, IconData>{
  "Setting": Icons.settings,
  "Payment Details": Icons.receipt_long,
  "Achievement": Icons.school,
  "Saved": Icons.favorite,
  "Reminders": Icons.notifications_active,
};

Column buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
        listInfo.length,
        (index) => GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.SETTINGS),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.h,
              vertical: 5.h,
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: AppColors.primaryElement,
                  ),
                  child: Icon(
                    listInfo.values.elementAt(index),
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 15.w),
                Text(
                  listInfo.keys.elementAt(index),
                  style: GoogleFonts.adventPro(
                    textStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
