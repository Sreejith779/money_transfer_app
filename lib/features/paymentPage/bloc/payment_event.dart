part of 'payment_bloc.dart';

@immutable
abstract class PaymentEvent {}

class PaymentInitialEvent extends PaymentEvent {}

class WalletAmountEvent extends PaymentEvent {}

class PaymentAmount extends PaymentEvent {
  final int amount;
  final  TransactionModel userDetails;

  PaymentAmount({required this.amount,required this.userDetails});


}

