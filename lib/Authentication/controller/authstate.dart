import 'package:climate/Authentication/view/Login.dart';
import 'package:climate/home_page/views/homepage._view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Auth {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GetStorage storage = GetStorage();

  Future<void> signin(String email, String password) async {
    try {
      var code = await auth.signInWithEmailAndPassword(
          email: email.trimRight(), password: password.trim());
      print("Signed in");
      var user = await auth.currentUser;
      Get.toNamed('/home');
      storage.write("authToken", user!.uid);
    } catch (e) {
      print("Firebase Sign in exception");
    }
  }

  Future<void> signout() async {
    auth.signOut();
    await storage.erase();
  }
}

// class Intial extends StatelessWidget {
//   const Intial({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return Homeview();
//           } else {
//             return const Login();
//           }
//         },
//       ),
//     );
//   }
// }
