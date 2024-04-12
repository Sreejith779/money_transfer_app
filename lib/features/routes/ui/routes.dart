import 'package:flutter/material.dart';

class Routes extends StatelessWidget {
  const Routes({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar:NavigationBar(
        destinations: const [
         NavigationDestination(icon: Icon(Icons.home), label: "Home"),
         NavigationDestination(icon: Icon(Icons.history), label: "Recent")
        ],

      )

    );
  }
}
