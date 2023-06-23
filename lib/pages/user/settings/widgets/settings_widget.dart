import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_app/common/widgets/common_widget.dart';
import 'package:learning_app/common/widgets/text_widgets.dart';

AppBar buildSettingsAppBar() {
  return AppBar(
    title: Text(
      "Settings",
      style: GoogleFonts.adventPro(
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Future<dynamic> buildShowDialog(
  BuildContext context, {
  required void Function()? onLogout,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.w)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildText(
                "Log Out",
                fontSize: 18,
              ),
              const Divider(),
              SizedBox(height: 10.h),
              buildText(
                "Are you sure to logout?",
                fontWeight: FontWeight.normal,
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: onLogout,
                child: buildButton("Log Out"),
              ),
              SizedBox(height: 5.h),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: buildButton(
                  "Cancel",
                  buttonColor: Colors.transparent,
                  border: Border.all(color: Colors.grey.shade300),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
