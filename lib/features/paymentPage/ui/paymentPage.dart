import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
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
      bloc: paymentBloc,
      listenWhen: (previous, current) => current is PaymentActiontState,
      buildWhen: (previous, current) => current is! PaymentActiontState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case PaymentLoadedState:
            return Scaffold(
              body: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 80),
                      child: Center(
                          child: CircleAvatar(
                        radius: 30,
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Paying ${widget.currentPerson.name}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/circle.png",
                          height: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Banking name: ${widget.currentPerson.bankingname.toUpperCase()}",
                          style: const TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child:
                          Text("+91 ${widget.currentPerson.number.toString()}"),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.currency_rupee_outlined),
                          SizedBox(
                            width: 100,
                            child: TextField(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 80, right: 80, bottom: 370, top: 20),
                        decoration: BoxDecoration(
                            color: Colors.deepPurple.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15)),
                        child: const TextField(
                            decoration: InputDecoration(
                                hintText: "Add a note",
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none))),
                      ),
                    )
                  ],
                ),
              ),
            );

          default:
            return const Text("Error");
        }
      },
    );
  }
}
