import 'package:flutter/material.dart';
//update

class UserHomePage extends StatelessWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const Center(
        child: Text(
          'Kullanıcı Ana Sayfası İçeriği',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  // AppBar Metodu
  AppBar _buildAppBar() {
    return AppBar(
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
      leading: Padding(
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
      toolbarHeight: 60,
    );
  }

  // BottomNavigationBar Metodu
  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFFF1F1F1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomIcon(
            icon: Icons.home,
            onPressed: () => Navigator.pushNamed(context, '/user_home'),
          ),
          _buildBottomIcon(
            icon: Icons.payment,
            onPressed: () => Navigator.pushNamed(context, '/user_payment'),
          ),
          _buildBottomIcon(
            icon: Icons.person,
            onPressed: () => Navigator.pushNamed(context, '/user_profile'),
          ),
        ],
      ),
    );
  }

  // IconButton Metodu
  Widget _buildBottomIcon({required IconData icon, required VoidCallback onPressed}) {
    return IconButton(
      icon: Icon(icon, color: const Color(0xFF303030), size: 30),
      onPressed: onPressed,
    );
  }
}
