import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'login.dart';
import 'user_home_page.dart';
import 'admin_home_page.dart';
import 'user_payment_page.dart';
import 'user_profile_page.dart';
//a
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FinanceApp());
}

class FinanceApp extends StatefulWidget {
  const FinanceApp({Key? key}) : super(key: key);

  @override
  State<FinanceApp> createState() => _FinanceAppState();
}

class _FinanceAppState extends State<FinanceApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taner Eren',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/user_home': (context) => const UserHomePage(),
        '/admin_home': (context) => const AdminHomePage(),
        '/user_payment': (context) => const UserPaymentPage(),
        '/user_profile': (context) => const UserProfilePage(),
      },
    );
  }
}
