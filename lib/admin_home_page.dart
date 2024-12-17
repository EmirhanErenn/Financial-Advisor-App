import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  // Kullanıcı Bilgisi ve Profil Resmi Burda
  Widget _buildWelcomeSection() {
    return const Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('lib/assets/images/default_profile.png'),
          // Yorum: Buradaki resim veritabanından çekilecektir.
        ),
        const SizedBox(width: 10), // Resim ve metin arasında boşluk
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Hoş Geldiniz,',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
            Text(
              'Admin Kullanıcı', // Buradaki veri veritabanından çekilecek
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Çıkış Yap Butonu
  Widget _buildLogoutButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/'); // Çıkış sonrası login sayfasına yönlendirme
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: const Text(
        'Çıkış Yap',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }

  // İşlev Butonları
  Widget _buildActionButton(BuildContext context, String label, IconData icon, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF003366),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      icon: Icon(icon, color: Colors.white, size: 24),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }

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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 10),
          _buildWelcomeSection(), // Hoş Geldiniz Bölümü
          const SizedBox(height: 40), // Hoş Geldiniz ile diğer bileşenler arasında boşluk
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildActionButton(context, 'Dosya Yönetimi', Icons.folder, () {
                  Navigator.pushNamed(context, '/file_management');
                }),
                const SizedBox(height: 20), // Butonlar arasında boşluk
                _buildActionButton(context, 'Müşteri Yönetimi', Icons.group, () {
                  Navigator.pushNamed(context, '/customer_management');
                }),
              ],
            ),
          ),
          const SizedBox(height: 20), // Çıkış Yap ile diğer bileşenler arasında boşluk
          _buildLogoutButton(context), // Çıkış Yap Butonu
        ],
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
            icon: Icons.folder,
            onPressed: () {
              // admin için düzenlenecek
            },
          ),
          _buildNavIcon(
            icon: Icons.group,
            onPressed: () {
              // admin için düzenlencek burası önemli beke
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNavIcon({required IconData icon, required VoidCallback onPressed}) {
    return IconButton(
      icon: Icon(icon, color: const Color(0xFF303030), size: 30),
      onPressed: onPressed,
    );
  }
}
