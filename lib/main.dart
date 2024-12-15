import 'package:financial_advisor_app/admin_add_user_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'login.dart';
import 'user_home_page.dart';
import 'admin_home_page.dart';
import 'user_payment_page.dart';
import 'user_profile_page.dart';
import 'package:google_fonts/google_fonts.dart';

//update
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
        textTheme: GoogleFonts.openSansTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Login_Page(),
        '/user_home': (context) => const UserHomePage(),
        '/admin_home': (context) => const AdminHomePage(),
        '/user_payment': (context) => const UserPaymentPage(),
        '/user_profile': (context) => const UserProfilePage(),
        '/admin_add_user': (context) => const Admin_User_Add_Page(),
      },
    );
  }
}
