import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeNavigateEvent>(homeNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadedState());
  }

  FutureOr<void> homeNavigateEvent(HomeNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateActioState());
  }
}