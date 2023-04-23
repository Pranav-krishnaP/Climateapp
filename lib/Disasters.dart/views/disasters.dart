import 'package:climate/Disasters.dart/models/disasters_model.dart';
import 'package:climate/core/constants.dart';
import 'package:climate/core/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

Disastermodel? selected;
var view = 1.obs;

class Disasters extends StatefulWidget {
  const Disasters({super.key});

  @override
  State<Disasters> createState() => _DisastersState();
}

class _DisastersState extends State<Disasters> {
  final Disasterall elements = Disasterall();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: h,
        width: w,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background_disaster.png"),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            verticalspacing(h * 0.05),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.toNamed('/home');
                    },
                    icon: Icon(Icons.arrow_back)),
                SizedBox(
                  width: w * 0.247,
                ),
                Text(
                  "Disasters",
                  style: Futtheme.font1
                      .copyWith(color: Colors.white, fontSize: w * 0.06),
                ),
              ],
            ),
            verticalspacing(h * 0.09),
            Obx(() => AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                  child: view.value == 1
                      ? ListBuild(h: h, w: w, elements: elements)
                      : Description(w: w, h: h),
                ))
          ],
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.w,
    required this.h,
  });

  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.01),
            child: Container(
              width: double.infinity,
              height: h * 0.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(w * 0.05)),
                  image: DecorationImage(
                    image: AssetImage(selected!.image_link),
                    fit: BoxFit.fill,
                  )),
            ),
          ),
          verticalspacing(h * 0.08),
          Container(
              height: h * 0.40,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
              child: Column(
                children: [
                  verticalspacing(h * 0.03),
                  Text(
                    selected!.disaster_name,
                    style: Futtheme.font1
                        .copyWith(fontSize: w * 0.05, color: Colors.white),
                  ),
                  verticalspacing(h * 0.05),
                  Text(
                    selected!.disaster_desc,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: Futtheme.font1
                        .copyWith(fontSize: w * 0.04, color: Colors.white),
                  ),
                  verticalspacing(h * 0.05),
                  ElevatedButton(
                      onPressed: () {
                        view.value = 1;
                      },
                      child: Text("GO BACK"))
                ],
              )),
        ],
      ),
    );
  }
}

class ListBuild extends StatelessWidget {
  const ListBuild({
    super.key,
    required this.h,
    required this.w,
    required this.elements,
  });

  final double h;
  final double w;
  final Disasterall elements;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.01),
      child: SizedBox(
        height: h * 0.8,
        child: ListView.builder(
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              selected = elements.dis[index];
              view.value = 0;
            },
            child: Container(
              width: w * 0.5,
              height: h * 0.3,
              margin: EdgeInsets.only(bottom: h * 0.06),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(w * 0.05)),
                  image: DecorationImage(
                    image: AssetImage(elements.dis[index].image_link),
                    fit: BoxFit.fill,
                  )),
              child: Center(
                  child: Text(
                elements.dis[index].disaster_name,
                style: Futtheme.font1
                    .copyWith(color: Colors.white, fontSize: w * 0.07),
              )),
            ),
          ),
          itemCount: elements.dis.length,
        ),
      ),
    );
  }
}
