import 'package:climate/core/constants.dart';
import 'package:climate/core/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
            height: h,
            width: w,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/splash_screen.png"),
                    fit: BoxFit.fill)),
            child: Column(
              children: [
                verticalspacing(h * 0.5),
                const Image(image: AssetImage("assets/images/Logo.png")),
                SizedBox(
                  height: h * 0.1,
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/divert');
                    },
                    child: Text(
                      "Lets Go",
                      style: Futtheme.font1.copyWith(fontSize: w * 0.07),
                    ))
              ],
            )),
      ),
    );
  }
}
