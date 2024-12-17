import 'package:flutter/material.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  // AppBar Metodua
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

  // Body Metodu
  Widget _buildBody(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //ortalamak için unutma bunları Column a ekleyceksin (kendime not)
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildWelcomeSection(),
            const SizedBox(height: 16), // Butonlar arasında boşluk
            _buildActionButton(
              context,
              'Dosya Görüntüle',
              Icons.folder_open,
                  () {
                // Dosya görüntüleme işlemi
                Navigator.pushNamed(context, '/file_viewer'); //YAPILACAK DAHA YAPILMADI
              },
              isBold: true, //kalın yapar yazıyı bu da
            ),
            const SizedBox(height: 16), // Boşluk oluşturur
            _buildLogoutButton(context),
          ],
        ),
      ),
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
              'User', // Buradaki veri veritabanından çekilecek
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

  // Genel Amaçlı Buton Metodu Admin Sayfasındakiyle Aybnı
  Widget _buildActionButton(
      BuildContext context,
      String label,
      IconData icon,
      VoidCallback onPressed, {
        bool isBold = false,
      }) {
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
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
