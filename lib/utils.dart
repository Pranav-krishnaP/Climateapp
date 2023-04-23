import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

verticalspacing(double Height) {
  return SizedBox(
    height: Height,
  );
}

TextStyle headline() {
  return TextStyle(
    color: const Color(0xff0F0F10),
    fontFamily: "Poppins",
    fontWeight: FontWeight.w600,
    fontSize: 32.sp,
  );
}

TextStyle buttton() {
  return TextStyle(
    color: const Color(0xffFFFFFF),
    fontFamily: "Poppins",
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
  );
}
