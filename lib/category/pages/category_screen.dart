import 'package:flutter/material.dart';
import 'package:range_plus_flutter_app/category/data/category_data.dart';
import 'package:sizer/sizer.dart';

import '../../custom_packages/image_helper.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              separatorBuilder: (context, _) => SizedBox(
                    height: 1.h,
                  ),
              itemCount: categoryItem.length,
              itemBuilder: (context, index) {
                CategoryItem productList = categoryItem[index];
                return _listOfProduct(productList);
              }),
        ));
  }

  Widget _listOfProduct(CategoryItem items) => Padding(
        padding: EdgeInsets.only(left: 1.w, right: 1.w, top: 1.h),
        child: Card(
          color: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            margin: EdgeInsets.only(left: 5.w),
            height: 15.h,
            width: 100.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ImageHelper(
                      image: items.productImg,
                      height: 12.h,
                      width: 24.w,
                      imageType: ImageType.asset,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          items.productTitle,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        Text(
                          items.totalProduct,
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 15.h,
                  width: 15.w,
                  decoration: const BoxDecoration(
                      color: Color(0xFFF0F0F0),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15.0),
                          bottomRight: Radius.circular(15.0))),
                  child: const Icon(Icons.arrow_forward_ios_sharp),
                )
              ],
            ),
          ),
        ),
      );
}
