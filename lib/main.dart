import 'package:flutter/material.dart';

import 'features/homePage/ui/homePage.dart';
import 'features/routes/ui/routes.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
home: Routes(),
    );
  }
}
