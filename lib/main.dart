import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/constant/colors.dart';
import 'package:learning_app/common/routes/pages.dart';
import 'package:learning_app/global/global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.primaryBackground,
            appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: AppColors.primaryBackground,
              iconTheme: IconThemeData(
                color: AppColors.primaryText,
                // shadows: [
                //   Shadow(
                //     blurRadius: 10,
                //     offset: const Offset(0, 5),
                //     color: Colors.black.withOpacity(.1),
                //   )
                // ],
              ),
            ),
          ),
          // home: const Welcome(),
          onGenerateRoute: AppPages.generateRouteSettings,
          // initialRoute: "/",
          // routes: {
          //   "myHomePage": (context) => const MyHomePage(),
          //   "signIn": (context) => const SignIn(),
          //   "register": (context) => const Register(),
          // },
        ),
      ),
    );
  }
}
