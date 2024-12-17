import 'package:flutter/material.dart';

class UpdatePasswordPage extends StatelessWidget {
  const UpdatePasswordPage({super.key});

  // TextField için metot
  Widget buildPasswordField(String label) {
    return TextField(
      obscureText: true, // Şifre alanı için gizli yazı
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: const Color(0xFFF1F1F1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Güncelle Butonuu
  Widget buildUpdateButton() {
    return ElevatedButton(
      onPressed: () {
        // Şifre güncelleme işlemleri buraya eklenecek
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF003366),
        title: const Text(
          'Şifre Güncelleme Ekranı',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildPasswordField('Mevcut Şifre'),
            const SizedBox(height: 20),
            buildPasswordField('Yeni Şifre'),
            const SizedBox(height: 20),
            buildPasswordField('Yeni Şifre (Tekrar)'),
            const SizedBox(height: 20),
            buildUpdateButton(),
          ],
        ),
      ),
    );
  }
}
