part of 'home_bloc.dart';

@immutable
abstract class HomeState {}
abstract class HomeActionState extends HomeState{}

final class HomeInitial extends HomeState {}


class HomeLoadedState extends HomeState{}
class HomeNavigateActioState extends HomeActionState{}
