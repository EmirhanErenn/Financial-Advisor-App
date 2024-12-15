import 'package:flutter/material.dart';
//update

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  // AppBar Metodu
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF003366),
      title: const Text(
        'Admin Ana Sayfası',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    );
  }

  // Body Metodu
  Widget _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Admin Ana Sayfası İçeriği'),
          const SizedBox(height: 20),
          _buildAddUserButton(context),
        ],
      ),
    );
  }

  // Kullanıcı Ekle Butonu
  Widget _buildAddUserButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/admin_add_user');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF003366),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: const Text(
        'Kullanıcı Ekle',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }

  // Bottom Navigation Bar Metodu
  Widget _buildBottomNavBar(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFFF1F1F1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavIcon(
            icon: Icons.home,
            onPressed: () => Navigator.pushNamed(context, '/admin_home'),
          ),
          _buildNavIcon(
            icon: Icons.payment,
            onPressed: () {
              // admin için düzenlenecek
            },
          ),
          _buildNavIcon(
            icon: Icons.person,
            onPressed: () {
              // admin için düzenlenecek
            },
          ),
        ],
      ),
    );
  }

  // Bottom Navigation Bar Icon
  Widget _buildNavIcon({required IconData icon, required VoidCallback onPressed}) {
    return IconButton(
      icon: Icon(icon, color: const Color(0xFF303030), size: 30),
      onPressed: onPressed,
    );
  }
}
