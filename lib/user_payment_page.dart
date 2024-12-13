import 'package:flutter/material.dart';

class UserPaymentPage extends StatelessWidget {
  const UserPaymentPage({Key? key}) : super(key: key);
//a
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF003366),
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
      body: const Center(
        child: Text('Kullanıcı Ödeme Sayfası'),
      ),
      bottomNavigationBar: BottomAppBar(
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
      ),
    );
  }
}
