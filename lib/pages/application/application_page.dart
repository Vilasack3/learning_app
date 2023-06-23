import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/constant/colors.dart';
import 'package:learning_app/pages/application/bloc/application_bloc.dart';
import 'package:learning_app/pages/application/bloc/application_event.dart';
import 'package:learning_app/pages/application/bloc/application_state.dart';
import 'package:learning_app/pages/application/widgets/application_widget.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: buildPage(state.index),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.h),
              topRight: Radius.circular(15.h),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.primaryElement,
              currentIndex: state.index,
              backgroundColor: AppColors.secondaryBackground,
              onTap: (value) {
                context.read<AppBloc>().add(TriggerAppEvent(value));
                // logger.d("index is $value");
              },
              items: bottomNavigator,
            ),
          ),
        );
      },
    );
  }
}
