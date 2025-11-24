import 'package:flutter/material.dart';
import 'view/telaprincipal.dart';
import 'view/tela2_dart';
import 'view/finance_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const MyHomePage(title: "FinPlan"),
        '/bank': (_) => const BankOverviewScreen(),
        '/finance': (_) => const FinanceScreen(),
      },
    );
  }
}
