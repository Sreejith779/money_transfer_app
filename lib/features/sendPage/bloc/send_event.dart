part of 'send_bloc.dart';

@immutable
abstract class SendEvent {}

class SendInitialEvent extends SendEvent{}

class SendNavigateEvent extends SendEvent{
  final ContactModel sendAmount;

  SendNavigateEvent({required this.sendAmount});
}
