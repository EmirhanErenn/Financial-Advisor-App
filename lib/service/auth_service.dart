import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
//code
class AuthService {
  final firebaseAuth = FirebaseAuth.instance;
  final firebasecloud = FirebaseFirestore.instance;

  //FORGOT PASSWORD
  Future<String?> forgotPassword(String email) async {
    try {
      final result = await firebaseAuth.sendPasswordResetEmail(email: email);
    }
    catch(e) {
      print(e.toString());
    }
  }

  //SIGNUP (ADMIN KULLANICI EKLEME ISLEMI)
  Future<String?> signUp(String email, String password, String name, String surname, String phoneNumber) async {
    String? res;
    try {
      var result = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      try{
        final resultData = await firebasecloud.collection("Users").add({
          'name': name,
          'surname': surname,
          'phoneNumber': phoneNumber,
          'email': email
        });
      } catch (e) {
        print("$e");
      }
      res = "success";
    }on FirebaseAuthException catch(e) {
      switch(e.code)
      {
        case "email-already-in-use":
          res = "Mail zaten Kayıtlı";
          break;
        case "ERROR_INVALID_EMAIL":
        case "invalid-email":
          res = "Geçersiz Mail";
          break;
        default:
          res = "Bir hata ile karşılaşıldı, Lütfen birazdan tekrar deneyiniz";
          break;
      }
       return res;
    }
    return res;
  }

  //SIGNIN
  Future<String?> signIn(String email, String password) async {
    String? res;
    try {
      final userResult = await firebaseAuth.signInWithEmailAndPassword( // uzun bi islem oldugundan dolayı await ve async kullanılıyor not
          email: email, password: password);
      res = "success";
      // print(userResult.user!.email);
    }
    on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-credential":
          res = "Email veya şifre yanlış lütfen kontrol ediniz!";
          break;
        case "invalid-email":
          res = "Email formatınız yanlış lütfen kontrol ediniz!";
          break;
        case "network-request-failed":
          res = "Lütfen internet bağlantınızı kontrol ediniz!";
          break;
        default:
          res = 'Hata kodu: ${e.code}';
          break;
      }
    }
    return res;
  }

  Future<String?> adminSignIn(String email, String password, int adminKod) async {
    String? res;
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firebasecloud
          .collection('adminKod')
          .get();

      var dataList = querySnapshot.docs.map((doc) => doc.data()).toList();

      bool isAdminValid = false;
      for (var data in dataList) {
        if (data['kod_degeri'] == adminKod) {
          isAdminValid = true;
          break;
        }
      }

      if (isAdminValid) {
        try {
          // Kullanıcı girişi
          final userResult = await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password);

          res = "success";
        } on FirebaseAuthException catch (e) {
          switch (e.code) {
            case "invalid-credential":
              res = "Email veya şifre yanlış lütfen kontrol ediniz!";
              break;
            case "invalid-email":
              res = "Email formatınız yanlış lütfen kontrol ediniz!";
              break;
            case "network-request-failed":
              res = "Lütfen internet bağlantınızı kontrol ediniz!";
              break;
            default:
              res = 'Hata kodu: ${e.code}';
              break;
          }
        }
      } else {
        res = "Geçersiz admin kodu!";
      }
    } catch (e) {
      print("Hata: $e");
      res = "Beklenmedik bir hata oluştu!";
    }

    return res;
  }

}