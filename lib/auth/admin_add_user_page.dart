import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:financial_advisor_app/service/auth_service.dart';
import 'package:financial_advisor_app/widgets/SidebarWidget_Admin.dart';

class Admin_User_Add_Page extends StatefulWidget {
  const Admin_User_Add_Page({Key? key}) : super(key: key);

  @override
  State<Admin_User_Add_Page> createState() => _Admin_User_Add_PageState();
}

class _Admin_User_Add_PageState extends State<Admin_User_Add_Page> {
  late String email, password;
  final formKey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
  final authService = AuthService();

  bool isSidebarOpen = false; // Sidebar'ın açık olup olmadığını kontrol eden değişken

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: buildAppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: buildBody(context),
          ),
          SidebarWidget(isOpen: isSidebarOpen, onClose: toggleSidebar)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleSidebar,
        backgroundColor: const Color(0xFF003366),
        child: const Icon(Icons.menu, color: Colors.white),
      ),
    );
  }

  AppBar buildAppBar() {
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

  void toggleSidebar() {
    setState(() {
      isSidebarOpen = !isSidebarOpen;
    });
  }


  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                buildTitleText(),
                const SizedBox(height: 15),
                emailTextField(),
                const SizedBox(height: 15),
                passwordTextField(),
                const SizedBox(height: 15),
                buildElevatedButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTitleText() {
    return const Text(
      'Kayıt Olma Ekranı',
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Color(0xFF003366),
      ),
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Bilgileri Eksiksiz Doldurunuz";
        } else {}
      },
      onSaved: (value) {
        password = value!;
      },
      obscureText: true,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
        if (value!.isEmpty) {
          return "Bilgileri Eksiksiz Doldurunuz";
        } else {}
      },
      onSaved: (value) {
        email = value!;
      },
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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

  Widget buildElevatedButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          final result = await authService.signUp(email, password);
          if (result == "success") {
            formKey.currentState!.reset();
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Kayıt Başarıyla Gerçekleşti")));
            Navigator.pushReplacementNamed(context, "/admin_home");
          } else {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Hata'),
                    content: Text(result!),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Geri Dön'),
                      ),
                    ],
                  );
                });
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
        'Kullanıcı Ekle',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
