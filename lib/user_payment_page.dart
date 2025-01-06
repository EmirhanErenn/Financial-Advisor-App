import 'package:financial_advisor_app/widgets/SidebarWidget_User.dart';
import 'package:flutter/material.dart';
//code
class UserPaymentPage extends StatefulWidget {
  const UserPaymentPage({Key? key}) : super(key: key);

  @override
  State<UserPaymentPage> createState() => _UserPaymentPageState();
}

class _UserPaymentPageState extends State<UserPaymentPage> {
  bool isSidebarOpen = false;

  Widget buildPageContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Kullanıcı Ödeme Sayfası İçeriği'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/user_home');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF003366),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'Ana Sayfaya Dön',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void toggleSidebar() {
    setState(() {
      isSidebarOpen = !isSidebarOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF003366),
        title: const Text(
          'Taner Eren Mobile App',
          style: TextStyle(
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
      body: Stack(
        children: [
          buildPageContent(context),
          SidebarWidget(isOpen: isSidebarOpen, onClose: toggleSidebar)
        ],
      ) // Metodun çağrılması
    );
  }
}
