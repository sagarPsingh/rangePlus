import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final String? errorText;
  final bool obscureText;

  final TextEditingController textEditingController;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.hint,
    this.errorText,
    this.obscureText = false,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xff000000)),
          ),
          SizedBox(
            height: 1.h,
          ),
          TextField(
            controller: textEditingController,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffD1D1D1), width: 5)),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffD1D1D1), width: 2),
              ),
              hintText: hint,
            ),
          ),
        ],
      );
}
