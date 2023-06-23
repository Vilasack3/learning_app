import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/controller/sign_in_controller.dart';
import 'package:learning_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:learning_app/pages/sign_in/bloc/sign_in_event.dart';
import 'package:learning_app/pages/sign_in/bloc/sign_in_state.dart';
import 'package:learning_app/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:logger/logger.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var logger = Logger();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Scaffold(
        appBar: buildAppBar(title: "Sign In"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildThirdPartyLogin(context),
              Center(child: reusableText("Or use email account to login")),
              Container(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                ),
                margin: EdgeInsets.only(top: 60.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText("Email"),
                    buildTextField(
                        hintText: "Email",
                        textType: "email",
                        icon: Icons.email_outlined,
                        onChange: (value) {
                          context.read<SignInBloc>().add(EmailEvent(value));
                        }),
                    SizedBox(height: 12.h),
                    reusableText("Password"),
                    buildTextField(
                        hintText: "Password",
                        textType: "password",
                        icon: Icons.lock_outlined,
                        onChange: (value) {
                          context.read<SignInBloc>().add(PasswordEvent(value));
                        }),
                    SizedBox(height: 7.h),
                    forgotPassword(),
                    buildLoginAndRegisterButton(
                      textButton: "Sign In",
                      buttonType: "login",
                      onTap: () {
                        SignInController(context: context)
                            .handleSignIn("email");
                      },
                    ),
                    buildLoginAndRegisterButton(
                      textButton: "Sign Up",
                      buttonType: "register",
                      onTap: () {
                        Navigator.of(context).pushNamed("/register");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
