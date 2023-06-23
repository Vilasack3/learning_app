import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/welcome/bloc/welcome_event.dart';
import 'package:learning_app/pages/welcome/bloc/welcome_state.dart';

class WelcomeBlocs extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBlocs() : super(WelcomeState()) {
    // logger.d("Welcome Bloc");
    on<WelcomeEvent>((event, emit) {
      emit(WelcomeState(page: state.page));
    });
  }
}
