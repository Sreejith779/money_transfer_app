part of 'payment_bloc.dart';

@immutable
abstract class PaymentState {}
abstract class PaymentActiontState extends PaymentState{}

final class PaymentInitial extends PaymentState {}

class PaymentLoadedState extends PaymentState{

  final List<ContactModel>payment = contacts.map((e) =>
      ContactModel(name: e['name'], number: e['number'])).toList();
}

