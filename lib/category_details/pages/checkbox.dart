import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({Key? key}) : super(key: key);

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 10.w,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        titleSpacing: 0.0,
        title: const Text('Filter'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          Container(
            alignment: Alignment.center,
            child: Text(
              'Clear Filter',
              style: TextStyle(
                  color: const Color(0xFF000000),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}

//  bool value = false;
//
// Checkbox(
// value: value,
// onChanged: (bool? value) {
// setState(() {
// this.value = value!;
// });
// },
// ),
