import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/controller/register_controller.dart';
import 'package:learning_app/pages/register/bloc/register_bloc.dart';
import 'package:learning_app/pages/register/bloc/register_event.dart';
import 'package:learning_app/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:logger/logger.dart';

import 'bloc/register_state.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var logger = Logger();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBar(title: "Sign Up"),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  heightFactor: 2.0,
                  child:
                      reusableText("Enter your details below & free sign up"),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                  ),
                  margin: EdgeInsets.only(top: 40.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("Username"),
                      buildTextField(
                          hintText: "Enter your username",
                          textType: "username",
                          icon: Icons.person_outlined,
                          onChange: (value) {
                            context
                                .read<RegisterBloc>()
                                .add(UsernameEvent(value));
                          }),
                      SizedBox(height: 12.h),
                      reusableText("Email"),
                      buildTextField(
                          hintText: "Enter your email",
                          textType: "email",
                          icon: Icons.email_outlined,
                          onChange: (value) {
                            context.read<RegisterBloc>().add(EmailEvent(value));
                          }),
                      SizedBox(height: 12.h),
                      reusableText("Password"),
                      buildTextField(
                          hintText: "Enter your password",
                          textType: "password",
                          icon: Icons.lock_outlined,
                          onChange: (value) {
                            context
                                .read<RegisterBloc>()
                                .add(PasswordEvent(value));
                          }),
                      SizedBox(height: 12.h),
                      reusableText("Confirm Password"),
                      buildTextField(
                          hintText: "Enter your confirm",
                          textType: "password",
                          icon: Icons.lock_outlined,
                          onChange: (value) {
                            context
                                .read<RegisterBloc>()
                                .add(ConfirmPasswordEvent(value));
                          }),
                      SizedBox(height: 7.h),
                      reusableText(
                          "By creating an account you have to agree with our term & condition"),
                      SizedBox(height: 12.h),
                      buildLoginAndRegisterButton(
                        textButton: "Sign Up",
                        buttonType: "login",
                        onTap: () {
                          RegisterController(context: context)
                              .handleEmailRegister();
                        },
                      ),
                    ],
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
