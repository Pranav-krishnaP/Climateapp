import 'dart:async';

import 'package:climate/Authentication/controller/authstate.dart';
import 'package:climate/core/constants.dart';
import 'package:climate/core/functions.dart';
import 'package:climate/home_page/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Homeview extends StatelessWidget {
  Homeview({super.key});

  final TextEditingController controller = Get.find();
  final Homecontroller controller1 = Get.find();
  final Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Container(
            height: h,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/sun1.png"),
                    fit: BoxFit.fill)),
            child: Column(
              children: [
                verticalspacing(h * 0.04),
                Obx(() => (controller1.loading == false)
                    ? Text(
                        "${fahrenhiettoDegree(controller1.obj.value).round()}°c",
                        style: Futtheme.font1.copyWith(fontSize: w * 0.2),
                      )
                    : Text(
                        "${fahrenhiettoDegree(controller1.obj.value).round()}°c",
                        style: Futtheme.font1.copyWith(fontSize: w * 0.2),
                      )),
                Text("${(DateFormat("EEEEE").format(DateTime.now()))}",
                    style: Futtheme.font1.copyWith(fontSize: w * 0.1)),
                Obx(
                  () => Text("${controller1.season.value}",
                      style: Futtheme.font1.copyWith(fontSize: 23)),
                ),
                Obx(() => Text(
                      "${controller1.location.value}",
                      style: Futtheme.font1.copyWith(fontSize: 23),
                    )),
                verticalspacing(h * 0.07),
                SizedBox(
                  width: w * 0.8,
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller1.location.value = controller.text;
                              controller1.fetchWeather();
                            },
                            icon: Icon(Icons.search)),
                        hintText: "Enter Location",
                        filled: true,
                        fillColor: Color(0xffF9F9F9),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                  ),
                ),
                verticalspacing(h * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.cloudy_snowing),
                    Icon(Icons.cloudy_snowing),
                    Icon(Icons.cloudy_snowing)
                  ],
                ),
                verticalspacing(h * 0.03),
                Text("Latest & Trending",
                    style: Futtheme.font1.copyWith(fontSize: w * 0.07)),
                verticalspacing(h * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        height: 80,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed('/disaster');
                          },
                          child: Text("Disaster"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff0C0101).withOpacity(0.7),
                          ),
                        )),
                    SizedBox(
                        height: 80,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Workshop"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff0C0101).withOpacity(0.7),
                          ),
                        )),
                  ],
                ),
                verticalspacing(h * 0.02),
                ElevatedButton(
                    onPressed: () {
                      auth.signout();
                      Get.toNamed("/login");
                    },
                    child: Text("Signout"))
              ],
            ),
          ),
        ));
  }
}
