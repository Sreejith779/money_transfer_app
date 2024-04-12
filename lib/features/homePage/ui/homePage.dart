 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
import 'package:google_fonts/google_fonts.dart';
import 'package:money_transfer_app/features/sendPage/ui/sendPage.dart';

import '../bloc/home_bloc.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
  homeBloc.add(HomeInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous,current)=> current is HomeActionState,
      buildWhen: (previous,current)=> current is !HomeActionState,
  listener: (context, state) {
if(state is HomeNavigateActioState){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>
  SendPage()));
}
  },
  builder: (context, state) {
        switch(state.runtimeType){
          case HomeLoadedState:
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                leading: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 20,
                  ),
                ),
                title: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome back",style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15
                    ),),
                    Text("Sreejith K M",style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w500
                    ),),
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
                                color:Colors.deepPurple.withOpacity(0.9)
                            ),
                          ),
                        ),
                        Positioned(
                          top: 50,left: 280,
                          child: Image.network("https://pnghq.com/wp-content/uploads/atm-chip-png-transparent-images-free-download-transparent.png",
                            height: 40,),
                        ),

                        Positioned(
                          top: 140,left: 280,
                          child: Image.network("https://www.freepnglogos.com/uploads/mastercard-png/mastercard-logo-mastercard-logo-png-vector-download-19.png",
                            height: 50,),
                        ),
                        Positioned(
                          top: 145,left: 20,
                          child: Text("**** **** 9012 7856",
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: GoogleFonts.caladea().fontFamily,
                                fontWeight: FontWeight.w400,
                                color: Colors.white
                            ),),
                        ),
                        const Positioned(
                            top: 50,left: 20,
                            child: Text("Balance",
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),)),
                        Positioned(
                            top: 80,left: 20,
                            child: Text("\$15,782.00",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),)),
                        Positioned(
                            top: 72,left: 160,
                            child: IconButton(onPressed: () {  },
                              icon:  Icon(Icons.remove_red_eye_outlined,
                                color: Colors.white.withOpacity(0.9),
                                size: 28,),))



                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width*0.15,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: IconButton(onPressed: () {
                            homeBloc.add(HomeNavigateEvent());
                          },
                            icon: const Icon(Icons.send),),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width*0.15,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: IconButton(onPressed: () {  },
                            icon: const Icon(Icons.attach_money),),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width*0.15,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: IconButton(onPressed: () {  },
                            icon: const Icon(Icons.change_circle_rounded),),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width*0.15,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: IconButton(onPressed: () {  },
                            icon: const Icon(Icons.history),),
                        ),
                        const SizedBox(width: 10),

                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 22,top: 10,right: 25),
                          child: Text("Send"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5,top: 10,right: 22),
                          child: Text("Deposit"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10,right: 25),
                          child: Text("change"),
                        ),
                        Padding(
                          padding: EdgeInsets.only( top: 10,right: 30),
                          child: Text("history"),
                        )
                      ],
                    ),

                    const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text("Last Transactions",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600
                        ),),
                    )

                  ],
                ),
              ),
            );

          default:
            return Center(child: Text("Error"));
        }

  },
);
  }
}
