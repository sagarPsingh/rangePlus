import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 10.w,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ), //IconButton
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ), //
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ], //<Widget>[]
      ),
    );
  }
}
