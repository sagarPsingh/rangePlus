import 'package:flutter/material.dart';
import 'package:range_plus_flutter_app/custom_packages/enter_pin_widget.dart';
import 'package:range_plus_flutter_app/custom_packages/image_helper.dart';
import 'package:sizer/sizer.dart';

class VerifyYourMobileScreen extends StatelessWidget {
  const VerifyYourMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Card(
          elevation: 3,
          child: ImageHelper(
            imageType: ImageType.asset,
            image: 'assets/images/Mask group1.png',
            boxFit: BoxFit.fitWidth,
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Verify your Mobile Number",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 17.sp),
                      ),
                      Text(
                        "+91 - 9876543210",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 17.sp),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                "Please enter the OTP",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 13.sp),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              SquareShapedPinUI(
                emptyPinText: true,
                codeLength: 4,
                boxSize: (MediaQuery.of(context).size.width / 6) - 10,
              ),
              SizedBox(
                height: 2.5.h,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Resend OTP",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10.sp,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Container(
                height: 7.5.h,
                width: 100.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black),
                child: Center(
                    child: Text(
                  "Continue",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp),
                )),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
