import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page_event.dart';
import 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageState()) {
    on<HomePageDots>(homePageDots);
  }

  void homePageDots(HomePageDots event, Emitter<HomePageState> emitter) {
    emitter(state.copyWith(index: event.index));
  }
}
