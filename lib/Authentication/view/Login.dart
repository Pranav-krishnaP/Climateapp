import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controller/authstate.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Auth auth = Auth();
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff005E84), Color(0xff00BCCF)])),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 44.w),
                      height: 110.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/Logo.png"))),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 280.h,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sign In",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 23.sp),
                          ),
                          Text("Lets get started"),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "Username",
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextField(
                            controller: emailcontroller,
                            decoration: const InputDecoration(
                                hintText: "Enter Username",
                                filled: true,
                                fillColor: Color(0xffF9F9F9),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "Password",
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextField(
                            controller: passwordcontroller,
                            decoration: const InputDecoration(
                                hintText: "Enter Password",
                                filled: true,
                                fillColor: Color(0xffF9F9F9),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 125.w,
                        height: 40.h,
                        child: ElevatedButton(
                          onPressed: () {
                            auth.signin(
                                emailcontroller.text, passwordcontroller.text);
                          },
                          child: Text("Login"),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              backgroundColor: Color(0xffBDB35C)),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(color: Color(0xff870000)),
                            )),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Row(
                        children: [
                          Text("Create am account."),
                          TextButton(
                              onPressed: () {
                                Get.toNamed('/signup');
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(color: Color(0xff870000)),
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: FaIcon(FontAwesomeIcons.google),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: FaIcon(FontAwesomeIcons.facebook))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
