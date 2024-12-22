import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:financial_advisor_app/service/auth_service.dart';

//update

class Admin_Login_Page extends StatefulWidget {
  const Admin_Login_Page({Key? key}) : super(key: key);

  @override
  State<Admin_Login_Page> createState() => _Admin_Login_PageState();
}

class _Admin_Login_PageState extends State<Admin_Login_Page> {
  late String email, password;
  late int adminKod;
  final formKey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
  final authService = AuthService();


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
              adminKodTextField(),
              const SizedBox(height: 20,),
              loginButton(),
              const SizedBox(height: 20),
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
      style: TextStyle(color: Colors.black),
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
      style: TextStyle(color: Colors.black),
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

  TextFormField adminKodTextField() {
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
        adminKod = int.parse(value!);
      },

      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: "LÜtfen size verilen kodu giriniz",
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
  Widget loginButton() {
    return ElevatedButton(
      onPressed: () async {
        if(formKey.currentState!.validate())
        {
          formKey.currentState!.save();
          final result = await authService.adminSignIn(email, password,adminKod);
          if(result == "success")
          {
            Navigator.pushReplacementNamed(context, "/admin_home");
          }
          else
          {
            showDialog(context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Hata'),
                    content: Text(result!),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(
                            context
                        ),
                        child: const Text('Geri Dön'),),
                    ],
                  );
                }
            );
          }
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF003366),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: const Text(
        'Giriş Yap',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }

}
