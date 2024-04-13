import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:money_transfer_app/model/contactList.dart';
import 'package:money_transfer_app/model/contactModel.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<PaymentInitialEvent>(paymentInitialEvent);
  }

  FutureOr<void> paymentInitialEvent(PaymentInitialEvent event, Emitter<PaymentState> emit) {
    emit(PaymentLoadedState());
  }
}
