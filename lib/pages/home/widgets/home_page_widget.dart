import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_app/common/constant/colors.dart';
import 'package:learning_app/common/widgets/text_widgets.dart';
import 'package:learning_app/pages/home/bloc/home_page_bloc.dart';
import 'package:learning_app/pages/home/bloc/home_page_event.dart';
import 'package:lottie/lottie.dart';

import '../bloc/home_page_state.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: AppColors.primaryBackground,
    elevation: 6,
    shadowColor: Colors.black.withOpacity(.3),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 20.w,
          height: 15.h,
          child: Lottie.network(
            "https://assets5.lottiefiles.com/temp/lf20_Qi3v7b.json",
            fit: BoxFit.cover,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: SizedBox(
            width: 45.w,
            height: 45.h,
            child: Lottie.network(
              "https://assets3.lottiefiles.com/packages/lf20_NODCLWy3iX.json",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    ),
  );
}

Container homePageText(
  String? text, {
  Color? color,
  EdgeInsetsGeometry? margin,
  double? fontSize,
}) {
  return Container(
    margin: margin,
    child: Text(
      text!,
      style: GoogleFonts.adventPro(
        textStyle: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget searchBar() {
  return Container(
    margin: EdgeInsets.only(top: 15.h),
    padding: EdgeInsets.all(3.w),
    decoration: BoxDecoration(
      border: Border.all(),
      borderRadius: BorderRadius.circular(15.w),
    ),
    child: TextField(
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        hintText: 'Search...',
        focusedErrorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        // Add a clear button to the search bar
        suffixIcon: IconButton(
          // icon: const Icon(Icons.tune),
          icon: Lottie.network(
            "https://assets8.lottiefiles.com/private_files/lf30_uol7jo08.json",
            width: 20.w,
          ),
          color: AppColors.primaryText,
          onPressed: () {},
        ),
        // Add a search icon or button to the search bar
        prefixIcon: IconButton(
          icon: const Icon(Icons.search),
          color: AppColors.primaryText,
          onPressed: () {
            // Perform the search here
          },
        ),
      ),
    ),
  );
}

Widget sliderView(BuildContext context, HomePageState state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 15.h),
        width: 325.w,
        height: 150.h,
        child: PageView(
          onPageChanged: (value) {
            // logger.d(value.toString());
            context.read<HomePageBloc>().add(HomePageDots(value));
          },
          children: [
            sliderContainer(
                path:
                    "https://img.freepik.com/free-photo/green-marble-swirl-background-handmade-acrylic-paint_53876-124136.jpg?w=2000&t=st=1684460231~exp=1684460831~hmac=c10c707e256e541d14f7d6c84cb5751ad5ec5f1beb05711a8b6576e324c2559c"),
            sliderContainer(
                path:
                    "https://img.freepik.com/free-photo/artistic-paint-green-white-mixed_23-2148636814.jpg?w=2000&t=st=1684460896~exp=1684461496~hmac=9d6f7260938326044f3f2edfd14e881fb6706a6042ede71f8c659cd9892e227e"),
          ],
        ),
      ),
      DotsIndicator(
        dotsCount: 2,
        position: state.index,
        decorator: DotsDecorator(
          color: AppColors.secondaryBackground,
          activeColor: AppColors.primaryText,
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          size: const Size.square(6.0),
          activeSize: const Size(17.0, 5.0),
        ),
      ),
    ],
  );
}

Container sliderContainer({required String? path}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.h),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: NetworkImage(path!),
      ),
    ),
  );
}

Widget menuView() {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            reuseMenuText("Choose art work"),
            GestureDetector(
              onTap: () {},
              child: reuseMenuText(
                "See all",
                fontSize: 12,
                color: AppColors.primaryElement,
              ),
            ),
          ],
        ),
      ),
      Row(
        children: [
          menuCategories("All"),
          menuCategories(
            "Popular",
            color: Colors.transparent,
          ),
          menuCategories(
            "Newest",
            color: Colors.transparent,
          ),
        ],
      ),
    ],
  );
}

Container menuCategories(
  String? text, {
  Color color = AppColors.secondaryBackground,
  FontWeight fontWeight = FontWeight.bold,
}) {
  return Container(
    margin: EdgeInsets.only(
      right: 15.w,
      top: 15.h,
    ),
    padding: EdgeInsets.symmetric(
      horizontal: 15.w,
      vertical: 7.h,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7.h),
      color: color,
    ),
    child: reuseMenuText(
      text,
      fontSize: 12,
      fontWeight: fontWeight,
    ),
  );
}

Widget reuseMenuText(
  String? text, {
  Color color = AppColors.primaryText,
  double fontSize = 20,
  FontWeight fontWeight = FontWeight.bold,
}) {
  return Text(
    text!,
    style: GoogleFonts.adventPro(
      textStyle: TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color,
      ),
    ),
  );
}

Container artworkGrid() {
  return Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: AppColors.secondaryBackground,
      borderRadius: BorderRadius.circular(15.w),
      image: const DecorationImage(
        fit: BoxFit.fill,
        image: NetworkImage(
            "https://img.freepik.com/premium-photo/large-city-style-impressionism-painting-illustration-ai-generative_118124-18122.jpg?w=2000"),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(
            bottom: 5.h,
            left: 5.h,
            right: 5.h,
          ),
          padding: EdgeInsets.symmetric(horizontal: 5.h),
          decoration: BoxDecoration(
            // color: Colors.white.withOpacity(.7),
            borderRadius: BorderRadius.circular(15.w),
          ),
          child: buildText(
            "Large city in the style of impressionism painting",
            fontSize: 12,
            textColor: Colors.white,
          ),
        ),
      ],
    ),
  );
}
