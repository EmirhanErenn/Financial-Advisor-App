import 'package:flutter/material.dart';
import 'package:financial_advisor_app/widgets/SidebarWidget_User.dart';
//code
class UserProfileUpdatePage extends StatefulWidget {
  const UserProfileUpdatePage({Key? key}) : super(key: key);

  @override
  State<UserProfileUpdatePage> createState() => _UserProfileUpdatePageState();
}

class _UserProfileUpdatePageState extends State<UserProfileUpdatePage> {

  bool isSidebarOpen = false;

  // Profil Fotoğrafı (CircleAvatar) için metot
  Widget buildProfileImage() {
    return const Padding(
      padding: EdgeInsets.only(top: 10.0), // Fotoğrafı AppBar'a daha yakın yapıyoruz
      child: CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage('lib/assets/images/default_profile.png'),
      ),
    );
  }

  // TextField için metota
  Widget buildTextField(String label, String defaultValue, {bool isOptional = false}) {
    return TextField(
      controller: TextEditingController(text: defaultValue),
      decoration: InputDecoration(
        labelText: label + (isOptional ? ' (Opsiyonel)' : ''),
        filled: true,
        fillColor: const Color(0xFFF1F1F1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  void toggleSidebar() {
    setState(() {
      isSidebarOpen = !isSidebarOpen;
    });
  }

  // Şifremi Değiştir Butonu için metot
  Widget buildChangePasswordButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/update_password'); // Şifre değiştirme sayfasına yönlendirme
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: const Text(
        'Şifremi Değiştir',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }

  // Kaydet Butonu için metot
  Widget buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        // Güncelleme işlemleri buraya gelecek
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF003366),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: const Text(
        'Kaydet',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }

  // Sayfa içeriğini döndüren metot
  Widget buildPageContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildProfileImage(),
          const SizedBox(height: 20),
          buildTextField('Ad Soyad', 'Taner Eren'),
          const SizedBox(height: 20),
          buildTextField('E-Posta', 'taner.eren@example.com'),
          const SizedBox(height: 20),
          buildTextField('Telefon', '+90 555 123 4567'),
          const SizedBox(height: 20),
          buildTextField('Şirket', '', isOptional: true),
          const SizedBox(height: 20),
          buildChangePasswordButton(context), // Şifremi Değiştir Butonu
          const SizedBox(height: 20),
          buildSaveButton(),
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
          'Bilgileri Güncelle',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            buildPageContent(context),
            SidebarWidget(isOpen: isSidebarOpen, onClose: toggleSidebar)
          ],
        ),
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
