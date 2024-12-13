import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);
//a
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF003366),
        title: const Text(
          'Admin Ana Sayfası',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: const Center(
        child: Text('Admin Ana Sayfası İçeriği'),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFFF1F1F1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: Color(0xFF303030), size: 30),
              onPressed: () {
                Navigator.pushNamed(context, '/admin_home');
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
