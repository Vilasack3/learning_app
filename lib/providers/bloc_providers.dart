import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/register/bloc/register_bloc.dart';
import 'package:learning_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:learning_app/pages/welcome/bloc/welcome_bloc.dart';

class AppBLocProviders {
  static get allBlocProviders => [
        BlocProvider(
          lazy: false,
          create: (BuildContext context) => WelcomeBlocs(),
        ),
        BlocProvider(
          lazy: false,
          create: (BuildContext context) => SignInBloc(),
        ),
        BlocProvider(
          lazy: false,
          create: (BuildContext context) => RegisterBloc(),
        ),
      ];
}
