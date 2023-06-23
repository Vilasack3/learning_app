import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/application/bloc/application_event.dart';
import 'package:learning_app/pages/application/bloc/application_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<TriggerAppEvent>((event, emit) {
      // logger.d("tapped index is ${event.index}");
      emit(AppState(index: event.index));
    });
  }
}
