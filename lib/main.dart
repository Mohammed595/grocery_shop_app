import 'package:flutter/material.dart';
import 'package:grocery_shop_app/pages/start_page.dart';
import 'package:grocery_shop_app/providerServ.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderServ(),
      child: MaterialApp(
        home: StartPage(),
      ),
    );
  }
}
