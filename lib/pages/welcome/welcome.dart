import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_app/common/constant/colors.dart';
import 'package:learning_app/common/constant/constant.dart';
import 'package:learning_app/common/logs/logger.dart';
import 'package:learning_app/global/global.dart';
import 'package:learning_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:learning_app/pages/welcome/bloc/welcome_event.dart';
import 'package:learning_app/pages/welcome/bloc/welcome_state.dart';
import 'package:lottie/lottie.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<WelcomeBlocs, WelcomeState>(
        builder: (context, state) {
          return Container(
            width: 375.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<WelcomeBlocs>(context).add(WelcomeEvent());
                    // logger.d("index value is : $index");
                  },
                  children: [
                    _page(
                      index: 1,
                      context: context,
                      buttonName: "next",
                      title: "Welcome...",
                      subTitle:
                          "The following line prevents the package from being accidentally published",
                      imagePath:
                          "https://assets8.lottiefiles.com/packages/lf20_1pxqjqps.json",
                    ),
                    _page(
                      index: 2,
                      context: context,
                      buttonName: "next",
                      title: "More fun!",
                      subTitle:
                          "The following line prevents the package from being accidentally published",
                      imagePath:
                          "https://assets9.lottiefiles.com/packages/lf20_ggw4qc1o.json",
                    ),
                    _page(
                      index: 3,
                      context: context,
                      buttonName: "get started",
                      title: "Get Started",
                      subTitle:
                          "The following line prevents the package from being accidentally published",
                      imagePath:
                          "https://assets8.lottiefiles.com/packages/lf20_gomx2nck.json",
                    ),
                  ],
                ),
                Positioned(
                  bottom: 100.h,
                  child: DotsIndicator(
                    position: state.page,
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      activeColor: AppColors.primaryElement,
                      color: Colors.grey.withOpacity(.3),
                      size: const Size.square(8.0),
                      activeSize: const Size(15.0, 7.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _page({
    int? index,
    BuildContext? context,
    String? buttonName,
    String? title,
    String? subTitle,
    String? imagePath,
  }) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Lottie.network(
            imagePath!,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          child: Text(
            title!,
            style: GoogleFonts.adventPro(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 26.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            subTitle!,
            style: GoogleFonts.adventPro(
              textStyle: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index! < 3) {
              //do animation
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            } else {
              //jump to signIn page
              Global.storageService
                  .setBool(AppConstant.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              logger.wtf(
                  "The value is ${Global.storageService.getDeviceFirstOpen()}");
              Navigator.of(context!)
                  .pushNamedAndRemoveUntil("/signIn", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(
              top: 100.h,
              left: 25.w,
              right: 25.w,
            ),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(15.w),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Center(
              child: Text(
                buttonName!,
                style: GoogleFonts.adventPro(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
