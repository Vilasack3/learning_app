import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/widgets/flutter_toast.dart';
import 'package:learning_app/pages/register/bloc/register_bloc.dart';
import 'package:logger/logger.dart';

class RegisterController {
  final BuildContext context;
  var logger = Logger();

  RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String? username = state.username;
    String? email = state.email;
    String? password = state.password;
    String? confirmPassword = state.confirmPassword;

    if (username!.isEmpty) {
      toastInfo(msg: "Username can not be empty");
      return;
    }
    if (email!.isEmpty) {
      toastInfo(msg: "Email can not be empty");
      return;
    }
    if (password!.isEmpty) {
      toastInfo(msg: "Password can not be empty");
      return;
    }
    if (confirmPassword!.isEmpty) {
      toastInfo(msg: "Confirm Password can not be empty");
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user!.updateDisplayName(username);
        toastInfo(
            msg:
                "An email has been sent to your registered email. To activate it please check email box");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        toastInfo(msg: "The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: "The email already in use");
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: "Your email id is invalid");
      }
    }
  }
}
