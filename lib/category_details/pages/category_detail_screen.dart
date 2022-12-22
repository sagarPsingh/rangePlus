import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:range_plus_flutter_app/category_details/data/category_details_data.dart';
import 'package:sizer/sizer.dart';

import '../../custom_packages/image_helper.dart';

class CategoryDetailScreen extends StatefulWidget {
  const CategoryDetailScreen({Key? key}) : super(key: key);

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: false,
          titleSpacing: 0.0,
          title: const Text('Personal Care'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          actions: [
            ImageHelper(
              image: 'assets/images/arow_up_down.png',

              ///search icon
              width: 5.5.w,
              imageType: ImageType.asset,
              boxFit: BoxFit.contain,
            ),
            SizedBox(
              width: 5.w,
            ),
            ImageHelper(
              image: 'assets/images/filter.png',

              ///filter icon
              width: 7.w,
              imageType: ImageType.asset,
              boxFit: BoxFit.contain,
            ),
            SizedBox(
              width: 5.w,
            ),
          ],
          bottom: TabBar(
            labelPadding: const EdgeInsets.only(left: 7, right: 7),
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(width: 4.0),
                insets: EdgeInsets.symmetric(horizontal: 16.0)),
            unselectedLabelStyle:
                TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            unselectedLabelColor: Colors.black,
            isScrollable: true,
            labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
            tabs: const [
              Tab(
                text: 'Baby care',
              ),
              Tab(
                text: 'Body care',
              ),
              Tab(
                text: 'Hair care',
              ),
              Tab(
                text: 'Face care',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _babyCare(),
            _bodyCare(),
            Icon(Icons.directions_bike),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }

  _babyCare() => GridView.builder(
        itemCount: babyCategoryItem.length,
        itemBuilder: (context, index) {
          BabyCareCategory productList = babyCategoryItem[index];
          return _babyCareProduct(productList);
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // crossAxisSpacing: 10,
            // mainAxisSpacing: 10,
            childAspectRatio: (1 / 1.7)),
      );

  _babyCareProduct(BabyCareCategory babyCare) => Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: const Color(0xFFF2F2F2)),
        ),
        child: Stack(
          children: [
            Positioned(
                right: 10,
                top: 10,
                child: InkWell(
                  onTap: () {},
                  child: const CircleAvatar(
                    radius: 12,
                    backgroundColor: Color(0XffFF7427),
                    child: Icon(
                      Icons.add,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageHelper(
                      image: babyCare.productImg,
                      imageType: ImageType.asset,
                      height: 25.h,
                      width: 50.w,
                      boxFit: BoxFit.contain,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(babyCare.productName,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: const Color(0xFF000000),
                        )),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("£${babyCare.productCurrentPrice}",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp,
                              color: const Color(0xFF000000),
                            )),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text("£${babyCare.productPreviousPrice}",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFFC4C4CC),
                            )),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text("${babyCare.offerPercentage}% OFF",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFF0000),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    RatingBar(
                      initialRating: 3,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 3.h,
                      ratingWidget: RatingWidget(
                        full: const ImageHelper(
                          image: 'assets/images/ratestar.png',
                          imageType: ImageType.asset,
                          boxFit: BoxFit.contain,
                        ),
                        half: const ImageHelper(
                          image: 'assets/images/ratestar.png',
                          imageType: ImageType.asset,
                          boxFit: BoxFit.contain,
                        ),
                        empty: const ImageHelper(
                          image: 'assets/images/noratestar.png',
                          imageType: ImageType.asset,
                          boxFit: BoxFit.contain,
                        ),
                      ),
                      itemPadding: const EdgeInsets.only(right: 3),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      babyCare.deliveryTime,
                      style: TextStyle(
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp),
                    ),
                  ]),
            ),
          ],
        ),
      );

  _bodyCare() => Container(
        color: Colors.yellow.shade100,
      );
}
