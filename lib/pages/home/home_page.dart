import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/constant/colors.dart';
import 'package:learning_app/pages/home/widgets/home_page_widget.dart';

import 'bloc/home_page_bloc.dart';
import 'bloc/home_page_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBar(),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: homePageText(
                    "Hello World!",
                    color: AppColors.primaryText,
                    fontSize: 28.sp,
                    margin: EdgeInsets.only(top: 10.h),
                  ),
                ),
                SliverToBoxAdapter(
                  child: searchBar(),
                ),
                SliverToBoxAdapter(
                  child: sliderView(context, state),
                ),
                SliverToBoxAdapter(
                  child: menuView(),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    vertical: 18.h,
                    horizontal: 0.w,
                  ),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 1.3,
                    ),
                    delegate: SliverChildBuilderDelegate(childCount: 4, (
                      BuildContext context,
                      int index,
                    ) {
                      return artworkGrid();
                    }),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
