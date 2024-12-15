import 'package:flutter/material.dart';
//update

class UserPaymentPage extends StatelessWidget {
  const UserPaymentPage({Key? key}) : super(key: key);

  // Sayfa içeriğini döndüren metot
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

  // BottomAppBar'ı döndüren metot
  Widget buildBottomNavigationBar(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFFF1F1F1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home, color: Color(0xFF303030), size: 30),
            onPressed: () {
              Navigator.pushNamed(context, '/user_home');
            },
          ),
          IconButton(
            icon: const Icon(Icons.payment, color: Color(0xFF303030), size: 30),
            onPressed: () {
              Navigator.pushNamed(context, '/user_payment');
            },
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Color(0xFF303030), size: 30),
            onPressed: () {
              Navigator.pushNamed(context, '/user_profile');
            },
          ),
        ],
      ),
    );
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
      body: buildPageContent(context), // Metodun çağrılması
      bottomNavigationBar: buildBottomNavigationBar(context), // BottomAppBar metodu
    );
  }
}
