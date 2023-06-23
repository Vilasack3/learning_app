import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/register/bloc/register_event.dart';
import 'package:learning_app/pages/register/bloc/register_state.dart';
import 'package:logger/logger.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  var logger = Logger();

  RegisterBloc() : super(const RegisterState()) {
    on<UsernameEvent>(_usernameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<ConfirmPasswordEvent>(_confirmPasswordEvent);
  }

  void _usernameEvent(UsernameEvent event, Emitter<RegisterState> emitter) {
    emitter(state.copyWith(username: event.username));
    logger.d("username is ${event.username}");
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterState> emitter) {
    emitter(state.copyWith(email: event.email));
    logger.d("email is ${event.email}");
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterState> emitter) {
    emitter(state.copyWith(password: event.password));
    logger.d("password is ${event.password}");
  }

  void _confirmPasswordEvent(
      ConfirmPasswordEvent event, Emitter<RegisterState> emitter) {
    emitter(state.copyWith(confirmPassword: event.confirmPassword));
    logger.d("confirmPassword is ${event.confirmPassword}");
  }
}
