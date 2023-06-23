import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/sign_in/bloc/sign_in_event.dart';
import 'package:learning_app/pages/sign_in/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emitter) {
    emitter(state.copyWith(email: event.email));
    // logger.d("email is ${event.email}");
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emitter) {
    emitter(state.copyWith(password: event.password));
    // logger.d("password is ${event.password}");
  }
}
