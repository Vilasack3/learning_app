import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/constant/constant.dart';
import 'package:learning_app/common/widgets/flutter_toast.dart';
import 'package:learning_app/global/global.dart';
import 'package:learning_app/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:logger/logger.dart';

class SignInController {
  final BuildContext context;
  var logger = Logger();

  SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        //Accessing BlocProvider
        final state = context.read<SignInBloc>().state;
        String? emailAddress = state.email;
        String? password = state.password;
        if (emailAddress!.isEmpty) {
          toastInfo(msg: "You need to fill email address");
          return;
          // logger.d("email empty");
        }

        if (password!.isEmpty) {
          toastInfo(msg: "You need to fill password");
          return;

          // logger.d("password empty");
        }
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
          if (credential.user == null) {
            toastInfo(msg: "You do not exist");
            return;

            // logger.d("user does not exist");
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "You need to verify your email account");
            return;

            // logger.d("not varied");
          }
          var user = credential.user;
          if (user != null) {
            //It has verified user from firebase
            Global.storageService
                .setString(AppConstant.STORAGE_USER_TOKEN_KEY, "12345");
            logger.w("user exist");
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/application", (route) => false);
          } else {
            //It has error getting user from firebase
            toastInfo(msg: "Currently you are not a user of this app");
            return;

            // logger.w("no user");
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            logger.w("no user found for that email");
            toastInfo(msg: "No user found for that email");
          } else if (e.code == 'wrong-password') {
            logger.w('wrong password provided for that user.');
            toastInfo(msg: "wrong password provided for that user.");
          } else if (e.code == 'invalid-email') {
            logger.w('email format is wrong');
            toastInfo(msg: "email format is wrong");
          }
        }
      }
    } catch (e) {
      logger.e(e);
    }
  }
}
