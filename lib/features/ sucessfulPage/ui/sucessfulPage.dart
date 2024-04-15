import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class SucessfulPage extends StatefulWidget {
  const SucessfulPage({super.key});

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
              height: 380,
              fit: BoxFit.contain,
              width: 600,
              repeat: false),
              Text("dhsjdhjshjh").animate().fade(duration: 1.seconds).scaleXY(delay: 500.ms)
            ],
          ),
        ),
      ),
    );
  }
}
