import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:money_transfer_app/model/paymentList.dart';

import '../../../model/contactList.dart';
import '../../../model/contactModel.dart';

part 'send_event.dart';
part 'send_state.dart';

class SendBloc extends Bloc<SendEvent, SendState> {
  SendBloc() : super(SendInitial()) {
   on<SendInitialEvent>(sendInitialEvent);
   on<SendNavigateEvent>(sendNavigateEvent);
  }

  FutureOr<void> sendInitialEvent(SendInitialEvent event, Emitter<SendState> emit) {
    emit(SendLoadedState());
  }

  FutureOr<void> sendNavigateEvent(SendNavigateEvent event, Emitter<SendState> emit) {
 paymentList.add(event.sendAmount);
    emit(SendNavigateActionState(clickedPerson: clickedPerson));
  }
}
