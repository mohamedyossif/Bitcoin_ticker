import 'package:bitcoin_ticker/constant.dart';
import 'package:flutter/material.dart';

import 'screens/home.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: KTheme,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
