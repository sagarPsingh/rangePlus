import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:range_plus_flutter_app/custom_packages/custom_text_field.dart';
import 'package:sizer/sizer.dart';

import '../custom_packages/custom_button.dart';
import '../custom_packages/enter_pin_widget.dart';

class ForgatPassword extends StatefulWidget {
  const ForgatPassword({Key? key}) : super(key: key);

  @override
  State<ForgatPassword> createState() => _ForgatPasswordState();
}

class _ForgatPasswordState extends State<ForgatPassword> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 10.h,
        title: Row(children: [
          Container(
            height: 8.h,
            width: 10.w,
            child: SvgPicture.asset(
              "assets/svgImages/bag.svg",
            ),
          ),
          SizedBox(
            width: 3.w,
          ),
          Text(
            "RangePlus",
            style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700),
          ),
        ]),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0))),
      ),
      body: Container(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              width: 100.w,
              child: Text(
                "Forgot Password",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp),
              ),
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
            TextButton(
              onPressed: () {},
              child: Text(
                "Resend OTP",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 11.sp,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(
              height: 3.5.h,
            ),
            CustomTextField(
                label: "New Password",
                hint: 'enter new password',
                textEditingController: passwordController),
            SizedBox(
              height: 2.5.h,
            ),
            CustomTextField(
                label: "Confirm Password",
                hint: 're - enter password',
                textEditingController: passwordController),
            SizedBox(
              height: 5.h,
            ),
            CustomButton(text: "Confirm", ontap: () {}),
            SizedBox(
              height: 5.h,
            ),
            Container(
              height: 9.h,
              width: 85.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.black),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "OTP has been send to",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp),
                  ),
                  Text(
                    "edn**********@e****.com",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
