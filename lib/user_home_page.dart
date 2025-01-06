import 'package:financial_advisor_app/widgets/SidebarWidget_User.dart';
import 'package:flutter/material.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  bool isSidebarOpen = false; // Sidebar'ın açık olup olmadığını kontrol eden değişken

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          _buildBody(context),
          SidebarWidget(isOpen: isSidebarOpen, onClose: toggleSideBar),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleSideBar,
        backgroundColor: const Color(0xFF003366),
        child: const Icon(Icons.menu, color: Colors.white),
      ),
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

  void toggleSideBar() {
    setState(() {
      isSidebarOpen = !isSidebarOpen;
    });
  }

  // Body Metodu
  Widget _buildBody(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .center, //ortalamak için unutma bunları Column a ekleyceksin (kendime not)
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
                Navigator.pushNamed(
                    context, '/file_viewer'); //YAPILACAK DAHA YAPILMADI
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
        Navigator.pushNamed(
            context, '/'); // Çıkış sonrası login sayfasına yönlendirme
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
