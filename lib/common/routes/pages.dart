//unify Bloc Provider and routes and pages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/logs/logger.dart';
import 'package:learning_app/common/routes/names.dart';
import 'package:learning_app/global/global.dart';
import 'package:learning_app/pages/application/application_page.dart';
import 'package:learning_app/pages/application/bloc/application_bloc.dart';
import 'package:learning_app/pages/home/bloc/home_page_bloc.dart';
import 'package:learning_app/pages/home/home_page.dart';
import 'package:learning_app/pages/register/bloc/register_bloc.dart';
import 'package:learning_app/pages/register/register.dart';
import 'package:learning_app/pages/search/bloc/search_bloc.dart';
import 'package:learning_app/pages/search/search_page.dart';
import 'package:learning_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:learning_app/pages/sign_in/sign_in.dart';
import 'package:learning_app/pages/user/settings/bloc/settings_bloc.dart';
import 'package:learning_app/pages/user/settings/settings_page.dart';
import 'package:learning_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:learning_app/pages/welcome/welcome.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(create: (_) => WelcomeBlocs()),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(create: (_) => AppBloc()),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignInPage(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const RegisterPage(),
        bloc: BlocProvider(create: (_) => RegisterBloc()),
      ),
      PageEntity(
        route: AppRoutes.HOME_PAGE,
        page: const HomePage(),
        bloc: BlocProvider(create: (_) => HomePageBloc()),
      ),
      PageEntity(
        route: AppRoutes.SEARCH,
        page: const SearchPage(),
        bloc: BlocProvider(create: (_) => SearchBloc()),
      ),
      PageEntity(
        route: AppRoutes.SETTINGS,
        page: const SettingsPage(),
        bloc: BlocProvider(create: (_) => SettingsBloc()),
      ),
    ];
  }

  //return all bloc provider
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  //a modal that covers entire screen as we click on navigator object
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //check for route name matching when navigator gets triggered
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        // logger.d("first log");
        // logger.d(result.first.route);
        // logger.d("valid route name ${settings.name}");
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isSignedIn = Global.storageService.getIsSignIn();
          if (isSignedIn) {
            return MaterialPageRoute(
              builder: (_) => const ApplicationPage(),
              settings: settings,
            );
          }
          return MaterialPageRoute(
            builder: (_) => const SignInPage(),
            settings: settings,
          );
        }
        return MaterialPageRoute(
          builder: (_) => result.first.page,
          settings: settings,
        );
      }
    }
    logger.w("invalid route name ${settings.name}");

    return MaterialPageRoute(
      builder: (_) => const SignInPage(),
      settings: settings,
    );
  }
}

//unify route, page, bloc provider
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    required this.bloc,
  });
}
