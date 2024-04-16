part of 'payment_bloc.dart';

@immutable
abstract class PaymentState {}

abstract class PaymentActionState extends PaymentState {}

final class PaymentInitial extends PaymentState {}

class PaymentLoadedState extends PaymentState {}
class PaymentAmountActionState extends PaymentState{}
