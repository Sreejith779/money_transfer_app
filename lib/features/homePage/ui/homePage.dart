import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 250),
                  child: Container(
                    height: 240,
                    width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:Colors.deepPurple
                  ),
                  ),
                ),
                Positioned(
                  top: 300,left: 280,
                  child: Image.network("https://pnghq.com/wp-content/uploads/atm-chip-png-transparent-images-free-download-transparent.png",
                  height: 40,),
                ),

                Positioned(
                  top: 400,left: 280,
                  child: Image.network("https://www.freepnglogos.com/uploads/mastercard-png/mastercard-logo-mastercard-logo-png-vector-download-19.png",
                  height: 50,),
                ),
                Positioned(
                  top: 410,left: 20,
                  child: Text("1234 5678 9012 7856",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: GoogleFonts.sansita().fontFamily,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                  ),),
                ),
                const Positioned(
                  top: 290,left: 20,
                    child: Text("Balance",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),)),
                const Positioned(
                  top: 320,left: 20,
                    child: Text("\$15,782.00",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),)),
                Positioned(
                    top: 312,left: 160,
                    child: IconButton(onPressed: () {  },
                  icon: const Icon(Icons.remove_red_eye_outlined,
                  color: Colors.white,
                  size: 30,),))



              ],
            )
          ],
        ),
      ),
    );
  }
}
