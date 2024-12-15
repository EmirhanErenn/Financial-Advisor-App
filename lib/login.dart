import 'package:flutter/material.dart';
//update

class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {

  late String email,password;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              emailTextField(),
              const SizedBox(height: 20),
              passwordTextField(),
              const SizedBox(height: 20),
              _buildElevatedButton(
                text: 'Giriş Yap',
                onPressed: () => Navigator.pushNamed(context, '/user_home'),
              ),
              const SizedBox(height: 20),
              _buildElevatedButton(
                text: 'Admin Sayfası',
                onPressed: () => Navigator.pushNamed(context, '/admin_home'),
              ),
            ],
          ),
        ),
      ),
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
  TextFormField passwordTextField() {
    return TextFormField(
      validator: (value)
      {
        if(value!.isEmpty)
          {
            return "Lütfen Bilgileri Eksiksiz Doldurunuz";
          }
        else
          {}
      },
      onSaved: (value)
      {
        password = value!;
      },
      obscureText: true,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Şifreniz",
        filled: true,
        fillColor: const Color(0xFFF1F1F1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  TextFormField emailTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty)
          {
            return "Bilgileri Eksiksiz Doldurunuz";
          }
        else
          {}
      },
      onSaved: (value)
      {
          email = value!;
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "E Posta Adresiniz",
        filled: true,
        fillColor: const Color(0xFFF1F1F1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // ElevatedButton Metodu
  Widget _buildElevatedButton({required String text, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF003366),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
