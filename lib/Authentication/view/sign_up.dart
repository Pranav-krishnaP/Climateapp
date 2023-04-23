import 'package:climate/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Sign_Up extends StatelessWidget {
  Sign_Up({super.key});

  final GetStorage storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    var emailcont = TextEditingController();
    var passcont = TextEditingController();
    var conpasscont = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 56.w),
          child: Column(
            children: [
              verticalspacing(150.h),
              Text(
                "Sign In",
                style: headline(),
              ),
              verticalspacing(42.h),
              TextFormField(
                controller: emailcont,
                decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              verticalspacing(20.h),
              TextFormField(
                controller: passcont,
                decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              verticalspacing(20.h),
              TextFormField(
                controller: conpasscont,
                decoration: InputDecoration(
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              verticalspacing(70.h),
              SizedBox(
                width: 400,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff0F0F10),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    onPressed: () async {
                      if (conpasscont.text == passcont.text) {
                        try {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: emailcont.text.trim(),
                            password: passcont.text.trim(),
                          );
                          var user = FirebaseAuth.instance.currentUser;
                          storage.write("authToken", user!.uid);
                          Get.toNamed('/home');
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
                    child: Text(
                      "Log in",
                      style: buttton(),
                    )),
              ),
              verticalspacing(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont have an account",
                    style: TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, "/");
                      },
                      child: Text(
                        "Signup",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
