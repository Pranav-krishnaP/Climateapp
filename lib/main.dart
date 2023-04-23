import 'package:climate/Authentication/view/Login.dart';
import 'package:climate/Authentication/view/sign_up.dart';
import 'package:climate/Authentication/view/splash.dart';
import 'package:climate/Disasters.dart/views/disasters.dart';
import 'package:climate/getx_di.dart';
import 'package:climate/home_page/views/homepage._view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  GetXDependancyInjector().onInit();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GetStorage storage = GetStorage();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            getPages: [
              GetPage(name: '/home', page: () => Homeview()),
              GetPage(name: '/disaster', page: () => const Disasters()),
              GetPage(name: '/', page: () => const Splash()),
              GetPage(
                  name: '/divert',
                  page: () => storage.hasData('authToken')
                      ? Homeview()
                      : const Login()),
              GetPage(name: '/login', page: () => const Login()),
              GetPage(name: '/signup', page: () => Sign_Up())
            ],
          );
        });
  }
}
