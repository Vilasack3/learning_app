import 'package:flutter_bloc/flutter_bloc.dart';

import 'settings_event.dart';
import 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<TriggerSettings>(triggerSettings);
  }

  triggerSettings(SettingsEvent event, Emitter<SettingsState> emitter) {
    emitter(const SettingsState());
  }
}
