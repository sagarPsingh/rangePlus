import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../custom_packages/image_helper.dart';

class CardBottom extends StatelessWidget {
  const CardBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        title: const Text('Common widget'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 9.h,
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xFFFF7427),
              ),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageHelper(
                        image: 'assets/images/card.png',
                        imageType: ImageType.asset,
                        height: 4.5.h,
                        width: 9.w,
                        boxFit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        'Item added to the cart',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )
                    ],
                  ),
                  Positioned(
                    left: 18.w,
                    top: 1.h,
                    child: const CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.white,
                      child: Text('5',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: 12.h,
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xFFFF7427),
              ),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 3.w,
                      ),
                      ImageHelper(
                        image: 'assets/images/card.png',
                        imageType: ImageType.asset,
                        height: 3.5.h,
                        width: 7.w,
                        boxFit: BoxFit.contain,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        '(4) Items added \nto the cart',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 8.h,
                        width: 35.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: Colors.black,
                        ),
                        child: Text(
                          'Proceed to buy',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Icon(
                        Icons.clear,
                        size: 4.h,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Positioned(
                    left: 9.w,
                    top: 3.2.h,
                    child: const CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.white,
                      child: Text('5',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 12)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
