part of 'home_bloc.dart';

@immutable
abstract class HomeState {}
abstract class HomeActionState extends HomeState{}

final class HomeInitial extends HomeState {}


class HomeLoadedState extends HomeState{
  final int balanceAmount = BalanceAmount.mainBalance;
  final List<TransactionModel>transaction = transactions.map((e) =>
      TransactionModel(name: e.name, note: e.note, amount: e.amount)).toList();
  
}
class HomeNavigateActioState extends HomeActionState{}
