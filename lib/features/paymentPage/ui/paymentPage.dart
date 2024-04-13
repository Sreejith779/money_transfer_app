import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_transfer_app/model/contactModel.dart';

import '../bloc/payment_bloc.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key, required this.currentPerson});
  final ContactModel currentPerson;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PaymentBloc paymentBloc = PaymentBloc();
  @override
  void initState() {
 paymentBloc.add(PaymentInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentBloc, PaymentState>(
      bloc:paymentBloc,
      listenWhen: (previous,current)=> current is PaymentActiontState,
      buildWhen: (previous,current)=> current is !PaymentActiontState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case PaymentLoadedState:
            return Scaffold(
              body: Container(
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 120),
                      child: Center(child: CircleAvatar(
                        radius: 30,
                      )),
                    ),

                  ],
                ),
              ),
            );

          default:
            return Text("Error");
        }


      },
    );
  }
}
