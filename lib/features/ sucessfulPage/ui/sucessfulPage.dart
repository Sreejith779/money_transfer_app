import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:money_transfer_app/features/homePage/ui/homePage.dart';
import 'package:money_transfer_app/model/contactModel.dart';

class SucessfulPage extends StatefulWidget {
  const SucessfulPage({super.key, required this.payeeName, required this.finalAmount});

  final ContactModel payeeName;
  final int finalAmount;

  @override
  State<SucessfulPage> createState() => _SucessfulPageState();
}

class _SucessfulPageState extends State<SucessfulPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 100,),
          child:   Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.network("https://lottie.host/49456049-5453-4d66-b77b-75f3ddb98b54/OLVEEO5Z4D.json",
              height: 340,
              fit: BoxFit.contain,
              width: 500,
              repeat: false),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.currency_rupee_outlined),
                  Text(widget.finalAmount.toString(),
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500
                  ),),
                ],
              ).animate().fade(duration: 2.seconds).scaleX(duration:200.ms ),
              Text("Paid to ${widget.payeeName.name}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500
              ),).animate().fade(duration: 1.seconds).scaleXY(delay: 500.ms),

              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: InkWell(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    HomePage( )));
                },
                  child: Container(
                    height: 55,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: const Center(child: Text("Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                    ),)),
                  ).animate().fade().visibility(delay: 2.seconds),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
