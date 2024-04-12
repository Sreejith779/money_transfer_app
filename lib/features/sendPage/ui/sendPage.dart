import 'package:flutter/material.dart';

class SendPage extends StatefulWidget {
  const SendPage({super.key});

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Send Money",
        style: TextStyle(
          fontWeight: FontWeight.w500
        ),),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 60,
              width: double.maxFinite,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(15),
               border: Border.all()
             ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none
                  )
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
