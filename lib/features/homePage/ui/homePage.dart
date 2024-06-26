import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:money_transfer_app/features/sendPage/ui/sendPage.dart';
import 'package:money_transfer_app/model/walletBalance.dart';

import '../bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc homeBloc = HomeBloc();
  final amount = BalanceAmount.mainBalance;

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateActioState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SendPage()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadedState:
            final loadedState = state as HomeLoadedState;
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                leading: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage("https://media.licdn.com/dms/image/C5603AQG345D1bUFyXA/profile-displayphoto-shrink_800_800/0/1517789760856?e=2147483647&v=beta&t=0chaK8MCoqnGMjd6aW4t83CBKrSHI_2Fz0FwAh-g6KE"),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome back",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    Text(
                      "Sreejith K M",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                actions: const [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      child: Icon(Icons.notifications),
                    ),
                  )
                ],
              ),
              body: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            height: 200,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.deepPurple.withOpacity(0.9)),
                          ),
                        ),
                        Positioned(
                          top: 50,
                          left: 280,
                          child: Image.network(
                            "https://pnghq.com/wp-content/uploads/atm-chip-png-transparent-images-free-download-transparent.png",
                            height: 40,
                          ),
                        ),
                        Positioned(
                          top: 140,
                          left: 280,
                          child: Image.network(
                            "https://www.freepnglogos.com/uploads/mastercard-png/mastercard-logo-mastercard-logo-png-vector-download-19.png",
                            height: 50,
                          ),
                        ),
                        Positioned(
                          top: 145,
                          left: 20,
                          child: Text(
                            "**** **** 9012 7856",
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: GoogleFonts.caladea().fontFamily,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                        const Positioned(
                            top: 50,
                            left: 20,
                            child: Text(
                              "Balance",
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        Positioned(
                            top: 80,
                            left: 20,
                            child: Text(
                              amount.toString(),
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        Positioned(
                            top: 82,
                            left: 120,
                            child:  Text("Wallet Pay",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              fontFamily: GoogleFonts.cambo().fontFamily
                            ),)
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width * 0.35,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(15)),
                            child: TextButton(
                              onPressed: () {
                                homeBloc.add(HomeNavigateEvent());
                              },
                              child: Text(
                                "Send",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                            )),
                        const SizedBox(width: 10),
                        Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width * 0.35,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: Text(
                              "Deposit",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ))),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        "Recent Transactions",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.8)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: GridView(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, childAspectRatio: 7),
                        children: List.generate(
                            loadedState.transaction.length,
                            (index) => Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          loadedState
                                              .transaction[loadedState
                                                      .transaction.length -
                                                  index -
                                                  1]
                                              .name,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),


                                        Text(
                                          loadedState
                                              .transaction[loadedState
                                                      .transaction.length -
                                                  index -
                                                  1]
                                              .amount
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                      ),
                    )
                  ],
                ),
              ),
            );

          default:
            return const Center(child: Text("Error"));
        }
      },
    );
  }
}
