import 'package:flutter/material.dart';
import 'package:range_plus_flutter_app/logIn_screen/create_new_Account.dart';
import 'package:range_plus_flutter_app/splash_screen/splach_screen1.dart';
import 'package:range_plus_flutter_app/splash_screen/splash_screen.dart';
import 'package:sizer/sizer.dart';

import 'home/home_tabs.dart';
import 'logIn_screen/forget_password.dart';
import 'logIn_screen/login_screen.dart';
import 'logIn_screen/verify_your_mobile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'RangePlus',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeTabs(),
        );
      },
    );
  }
}
