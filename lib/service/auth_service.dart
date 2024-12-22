import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

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

  //SIGNUP
  Future<String?> signUp(String email, String password) async {
    String? res;
    try {
      var result = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      res = "success";
    } catch(e) {
      //hata yakalama yapılacak
      // return res;
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