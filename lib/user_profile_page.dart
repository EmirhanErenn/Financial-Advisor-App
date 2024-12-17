import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  // Profil Fotoğrafı (CircleAvatar) için metot
  Widget buildProfileImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0), // Fotoğraf AppBar'a yakın
      child: const CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage('lib/assets/images/default_profile.png'),
      ),
    );
  }

  // Bilgi satırı için widgeta
  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18, // Yazı tipi büyütüldü
              color: Colors.black87,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 18, // Yazı tipi büyütüldü
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Güncelle Butonu
  Widget buildUpdateButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/user_profile_update'); // Güncelleme sayfasına yönlendirme
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF003366),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: const Text(
            'Güncelle',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF003366),
        title: const Text(
          'Kullanıcı Profili',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          buildProfileImage(), // Profil fotoğrafı
          const SizedBox(height: 20), // Fotoğraf ile bilgiler arasında boşluk
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildInfoRow('Ad Soyad', 'Taner Eren'), // Örnek veri
                  const SizedBox(height: 20), // Bilgiler arası boşluk
                  buildInfoRow('E-Posta', 'taner.eren@example.com'), // Örnek veri
                  const SizedBox(height: 20), // Bilgiler arası boşluk
                  buildInfoRow('Telefon', '+90 555 123 4567'), // Örnek veri
                  const SizedBox(height: 20), // Bilgiler arası boşluk
                  buildInfoRow('Şirket', 'Örnek Şirket'), // Örnek veri (opsiyonel olabilir)
                  const SizedBox(height: 10), // Bilgiler ile buton arasında boşluk
                  // Yorum olarak ekleme:
                  // Buradaki veriler veritabanından çekilecektir.
                ],
              ),
            ),
          ),
          buildUpdateButton(context), // Güncelle butonu BottomBar'ın üstünde
          const SizedBox(height: 30),
        ],
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
