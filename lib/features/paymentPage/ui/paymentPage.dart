import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_transfer_app/features/%20sucessfulPage/ui/sucessfulPage.dart';
import 'package:money_transfer_app/model/contactModel.dart';
import 'package:money_transfer_app/model/transactionModel.dart';
import 'package:money_transfer_app/model/walletBalance.dart';

import '../bloc/payment_bloc.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key, required this.currentPerson});
  final ContactModel currentPerson;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PaymentBloc paymentBloc = PaymentBloc();
  bool isSelect = false;

  late int userEnteredAmount;
 
  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    paymentBloc.add(PaymentInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentBloc, PaymentState>(
      bloc: paymentBloc,
      listenWhen: (previous, current) => current is PaymentActionState,
      buildWhen: (previous, current) => current is! PaymentActionState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case PaymentLoadedState:
            final loadedState = state as PaymentLoadedState;
            return Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Padding(
                        padding: EdgeInsets.only(top: 80),
                        child: Center(
                            child: CircleAvatar(
                          radius: 30,
                              backgroundImage: NetworkImage(widget.currentPerson.images),
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Center(
                          child: Text(
                            "Paying To ${widget.currentPerson.name}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
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
                        child: Center(
                            child: Text(
                                "+91 ${widget.currentPerson.number.toString()}")),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.currency_rupee_outlined),
                            SizedBox(
                              width: 100,
                              child: TextField(
                                controller: amountController,
                                onChanged: (amount) {
                                  setState(() {
                                    userEnteredAmount =
                                        int.tryParse(amount) ?? 0000;
                                  });
                                },
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 22),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 90, right: 80, bottom: 30, top: 50),
                        decoration: BoxDecoration(
                            color: Colors.deepPurple.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(15)),
                        child:   const TextField(

                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintText: "Add a note",
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none))),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(),
                        child: Text(
                          "Pay from",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Positioned(
                                child: Checkbox(
                                    side: const BorderSide(
                                        color: Colors.deepPurple, width: 3),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    value: isSelect,
                                    onChanged: (value) {
                                      setState(() {
                                        isSelect = !isSelect;
                                      });
                                    }),
                              ),
                            ],
                          ),
                          const Text(
                            "Wallet pay",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 17),
                          )
                        ],
                      ),
                        Row(
                        children: [
                          const Text(
                              "Available Balance:"),
                          Text(" ${loadedState.balanceAmount} Rs"
                              ,style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16
                            ),)
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            child: Checkbox(
                                side: const BorderSide(
                                    color: Colors.deepPurple, width: 3),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                value: !isSelect,
                                onChanged: (card) {
                                  setState(() {
                                    isSelect = !isSelect;
                                  });
                                }),
                          ),
                          const Text(
                            "Card pay",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 17),
                          )
                        ],
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: InkWell(
                          onTap: () {
                           paymentBloc.add(PaymentAmount(amount: userEnteredAmount,
                               userDetails: TransactionModel(name: widget.currentPerson.name,
                                   note:  "", amount: userEnteredAmount))
                           );

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SucessfulPage(
                                          payeeName: widget.currentPerson,
                                          finalAmount:  userEnteredAmount
                                        )
                                )
                            );
                          },
                          child: Container(
                            width: double.maxFinite,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.deepPurple,
                            ),
                            child: const Center(
                              child: Text(
                                "Send",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
