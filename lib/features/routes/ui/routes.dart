import 'package:flutter/material.dart';
import 'package:money_transfer_app/features/homePage/ui/homePage.dart';
import 'package:money_transfer_app/features/recentPage/recentPage.dart';

class Routes extends StatefulWidget {
  const Routes({super.key});

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  var isSelect = 0;
 final List tabs =[
   HomePage( ),
   RecentPage()
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
      selectedIndex: isSelect,
      onDestinationSelected: (index) {
        setState(() {
          isSelect = index;
        });
      },
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: "Home"),
        NavigationDestination(icon: Icon(Icons.history), label: "Recent")
      ],
    ),
      body: tabs[isSelect],
    );
  }
}
