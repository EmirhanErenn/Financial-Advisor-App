import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FinanceApp());
}

class FinanceApp extends StatefulWidget {
  const FinanceApp({super.key});

  @override
  State<FinanceApp> createState() => _FinanceAppState();
}

class _FinanceAppState extends State<FinanceApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FinanceApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const HomePage(title: 'Finance Advisor App'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = "Murat"; // Örnek kullanıcı adı

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF003366),
        title: Text(
          widget.title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipOval(
                child: Image.asset(
                  'lib/assets/images/malii.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        toolbarHeight: 60,
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
               const Icon(
                  Icons.account_circle,
                  color: Color(0xFF003366),
                  size: 30,
                ),
                SizedBox(width: 10),
                Text('Hoşgeldin, $userName!', // kullanıcı adı dinamik bir degisken oldugundan dolayı cont kullanılamaz
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF003366),
                  ),
                ),
              ],
            ),
          ),
          //yeni widget gelebilir
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFF1F1F1), // Açık gri arka plan
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Color(0xFF303030 ), size: 30), // Lacivert renk ve daha büyük ikon
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage(title: 'Finance Advisor App')),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.payment, color: Color(0xFF303030 ), size: 30), // Lacivert renk ve daha büyük ikon
              onPressed: () {
                // Ödeme sayfası işlemi
              },
            ),
            IconButton(
              icon: Icon(Icons.person, color: Color(0xFF303030), size: 30), // Lacivert renk ve daha büyük ikon
              onPressed: () {
                // Profil sayfası işlemi
              },
            ),
          ],
        ),
      ),
    );
  }
}
