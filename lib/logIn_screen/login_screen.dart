import 'package:flutter/material.dart';
import 'package:range_plus_flutter_app/custom_packages/custom_text_field.dart';
import 'package:sizer/sizer.dart';

import '../custom_packages/custom_button.dart';
import '../custom_packages/image_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const Card(
            elevation: 3,
            child: ImageHelper(
              imageType: ImageType.asset,
              image: 'assets/images/Mask group.png',
              boxFit: BoxFit.fitWidth,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(18),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Login into your account",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 19.sp),
              ),
              SizedBox(
                height: 4.h,
              ),
              CustomTextField(
                  label: "Email ID / mobile Number",
                  hint: 'enter email id / mobile number',
                  textEditingController: emailController),
              SizedBox(
                height: 2.5.h,
              ),
              CustomTextField(
                  label: "Password",
                  hint: 'enter password',
                  textEditingController: passwordController),
              SizedBox(
                height: 2.5.h,
              ),
              Text(
                "Forget Password",
                style: TextStyle(color: Colors.black, fontSize: 12.sp),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              CustomButton(text: "Login", ontap: () {}),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New Customer?",
                    style: TextStyle(color: Colors.black, fontSize: 12.sp),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Create your new account",
                        style: TextStyle(
                            color: const Color(0xffFF7427),
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp),
                      ))
                ],
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
