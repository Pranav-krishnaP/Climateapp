import 'package:climate/Disasters.dart/models/disasters_model.dart';
import 'package:climate/home_page/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GetXDependancyInjector {
  void onInit() {
    Get.lazyPut(() => TextEditingController());
    Get.lazyPut(() => Homecontroller());
  }
}
