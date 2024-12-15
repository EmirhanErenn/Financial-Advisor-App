import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//update
class Admin_User_Add_Page extends StatefulWidget {
  const Admin_User_Add_Page({Key? key}) : super(key: key);

  @override
  State<Admin_User_Add_Page> createState() => _Admin_User_Add_PageState();
}

class _Admin_User_Add_PageState extends State<Admin_User_Add_Page> {
  late String email,password;
  final formKey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Klavye açıldığında ekranı otomatik olarak küçültür
      appBar: buildAppBar(),
      body: SingleChildScrollView( // Sayfanın kaydırılabilir olmasını sağlar
        child: buildBody(context),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  // AppBar Metodu
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

  // Body Metodu
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
                //diger bilgiler daha sonra alınacak
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Başlık Metodu
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
      validator: (value)
      {
        if(value!.isEmpty)
        {
          return "Bilgileri Eksiksiz Doldurunuz";
        }
        else
        {}
      },
      onSaved: (value)
      {
        password = value!;
      },
      obscureText: true,
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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

  // Button Metodu
  Widget buildElevatedButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
          if(formKey.currentState!.validate())
            {
              formKey.currentState!.save();
              try {
                var userResult
                = await firebaseAuth.createUserWithEmailAndPassword(
                    email: email, password: password);
                formKey.currentState!.reset();
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text("Kayıt Başarıyla Gerçekleşti")));
                Navigator.pushReplacementNamed(context, "/admin_home");
              } catch(e) {
                  print(e.toString());
              }
            }
          else
            {}
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
