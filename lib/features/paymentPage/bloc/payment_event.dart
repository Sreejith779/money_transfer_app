part of 'payment_bloc.dart';

@immutable
abstract class PaymentEvent {}

class PaymentInitialEvent extends PaymentEvent{

}

class WalletaAmountEvent extends PaymentEvent{}



