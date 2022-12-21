import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:range_plus_flutter_app/custom_packages/image_helper.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreenOne extends StatefulWidget {
  const SplashScreenOne({Key? key}) : super(key: key);

  @override
  State<SplashScreenOne> createState() => _SplashScreenOneState();
}

class _SplashScreenOneState extends State<SplashScreenOne> {
  int activeIndex = 0;
  var item = [
    1,
    2,
    3,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  backgroundColor: const Color(0XffFF7427),
        body: Column(
      // alignment: Alignment.topCenter,
      children: [
        Stack(
          children: [
            const ImageHelper(
              imageType: ImageType.asset,
              image: 'assets/images/EllipseSplashScreen.png',
              boxFit: BoxFit.fitWidth,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 80.h,
                onPageChanged: (index, pageIndex) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
              items: item.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return SizedBox(
                        height: 100.h,
                        width: 100.w,
                        child: Center(
                            child: Text(
                          "Splash Screen ${i.toString()}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18.sp),
                        )));
                  },
                );
              }).toList(),
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Skip",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11.sp),
              ),
              buildIndicator(),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black, //New
                        blurRadius: 0.2,
                      )
                    ],
                  ),
                  height: 5.5.h,
                  width: 16.w,
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 18,
                  )),
            ],
          ),
        )
      ],
    ));
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: item.length,
        effect: const JumpingDotEffect(
            dotHeight: 12, dotWidth: 12, activeDotColor: Colors.black),
      );
}
