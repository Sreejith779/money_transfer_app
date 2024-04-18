import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:money_transfer_app/model/contactModel.dart';
import 'package:money_transfer_app/model/transactionList.dart';

import 'package:money_transfer_app/model/walletBalance.dart';

import '../../../model/transactionModel.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<PaymentInitialEvent>(paymentInitialEvent);
    on<PaymentAmount>(paymentAmount);

  }

  FutureOr<void> paymentInitialEvent(PaymentInitialEvent event, Emitter<PaymentState> emit) {
    emit(PaymentLoadedState( ));
  }

  FutureOr<void> paymentAmount(PaymentAmount event, Emitter<PaymentState> emit) {
    BalanceAmount.payBalance(event.amount);
transactions.add(event.userDetails);

print(transactions.toString());
print(BalanceAmount.mainBalance);

    emit(PaymentLoadedState( ));
  }
}
