import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../custom_packages/custom_button.dart';
import '../custom_packages/custom_text_field.dart';

class CreateNewAccount extends StatefulWidget {
  const CreateNewAccount({Key? key}) : super(key: key);

  @override
  State<CreateNewAccount> createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
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
            Text(
              "Create New Account",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp),
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 5.5.h,
                  width: 32.w,
                  margin: const EdgeInsets.all(10),
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          width: 1.0,
                          color: Colors.black,
                          style: BorderStyle.solid,
                        ),
                      ),
                      onPressed: () {},
                      child: Text("Business",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700))),
                ),
                Container(
                    margin: EdgeInsets.all(10),
                    height: 5.5.h,
                    width: 32.w,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff585858),
                        ),
                        child: Text("Retailer")))
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomTextField(
                label: "Name*",
                hint: 'Enter first name',
                textEditingController: emailController),
            SizedBox(
              height: 2.5.h,
            ),
            CustomTextField(
                label: "Last Name*",
                hint: 'Enter last name',
                textEditingController: passwordController),
            SizedBox(
              height: 2.5.h,
            ),
            CustomTextField(
                label: "Email ID*",
                hint: 'Enter email id',
                textEditingController: passwordController),
            SizedBox(
              height: 2.5.h,
            ),
            CustomTextField(
                label: "Mobile Number",
                hint: 'Enter mobile number',
                textEditingController: passwordController),
            SizedBox(
              height: 2.5.h,
            ),
            CustomTextField(
                label: "Password",
                hint: 'Enter password',
                textEditingController: passwordController),
            SizedBox(
              height: 2.5.h,
            ),
            CustomTextField(
                label: "Confirm Password",
                hint: 'Re - enter password',
                textEditingController: passwordController),
            SizedBox(
              height: 5.h,
            ),
            CustomButton(text: "Create my account", ontap: () {}),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(color: Colors.black, fontSize: 12.sp),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Login here",
                      style: TextStyle(
                          color: const Color(0xffFF7427),
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp),
                    ))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
