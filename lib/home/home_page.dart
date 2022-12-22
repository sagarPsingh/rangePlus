import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:range_plus_flutter_app/model/mode.dart';
import 'package:sizer/sizer.dart';

import '../custom_packages/image_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselController carouselController = CarouselController();

  int activeIndex = 0;
  List<String> item = [
    'assets/images/download.jpg',
    'assets/images/spring.jpg',
    'assets/images/persion.png',
    'assets/images/persion.png',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: const Color(0XffEFEFEF),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            toolbarHeight: 16.h,
            title: Column(
              children: [
                Row(children: [
                  SizedBox(
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
                  const Spacer(),
                  ImageIcon(
                    const AssetImage('assets/images/location.png'),
                    color: Colors.black,
                    size: 3.5.h,
                  ),
                ]),
                SizedBox(
                  height: 6.h,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search Products, categories...",
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(15),
                        child: ImageIcon(
                          AssetImage('assets/images/searchIcon.png'),
                          color: Colors.grey,
                        ),
                      ),
                      suffixIcon: const Padding(
                        padding: EdgeInsets.all(15),
                        child: ImageIcon(
                          AssetImage('assets/images/mic.png'),
                          color: Colors.grey,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color(0xffD1D1D1), width: 2)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color(0xffD1D1D1), width: 2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // shape: const RoundedRectangleBorder(
            //     borderRadius: BorderRadius.only(
            //         bottomLeft: Radius.circular(10.0),
            //         bottomRight: Radius.circular(10.0))),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 30.h,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    // autoPlay: false,
                  ),
                  items: item
                      .map((i) => Container(
                            child: Center(
                              child: ImageHelper(
                                image: i,
                                imageType: ImageType.asset,
                                height: 30.h,
                                width: 100.w,
                                // boxFit: BoxFit.fill,
                              ),
                            ),
                          ))
                      .toList(),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.black,
                  height: 28.h,
                  width: 100.w,
                  child: Column(children: [
                    SizedBox(
                      width: 100.w,
                      child: Text("Deals of the Day",
                          textAlign: TextAlign.left,
                          style:
                              TextStyle(fontSize: 15.sp, color: Colors.white)),
                    ),
                    SizedBox(height: 1.h),
                    SizedBox(
                      height: 21.h,
                      width: 100.w,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, _) => const SizedBox(
                              // height: 1.h,
                              ),
                          itemCount: categoryItem.length,
                          itemBuilder: (context, index) {
                            CategoryItem productList = categoryItem[index];
                            return _listOfProduct(productList);
                          }),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text("Explore Items",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600)),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 38.h,
                  width: 100.w,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, _) => SizedBox(
                            height: 1.h,
                          ),
                      itemCount: categoryItem.length,
                      itemBuilder: (context, index) {
                        CategoryItem productList = categoryItem[index];
                        return _listOfProduct2(productList);
                      }),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  color: const Color(0xffFFF2D0),
                  height: 37.5.h,
                  width: 100.w,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Top Deals",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600)),
                          Container(
                            height: 30.h,
                            width: 100.w,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, _) => SizedBox(
                                      width: 1.2.h,
                                    ),
                                itemCount: categoryItem.length,
                                itemBuilder: (context, index) {
                                  CategoryItem productList =
                                      categoryItem[index];
                                  return _listOfProduct3(productList);
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: const Color(0xffFAFAFA),
                  height: 52.h,
                  width: 100.w,
                  child: Column(children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      width: 100.w,
                      child: Text(
                        "Best Offers",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                      child: AppBar(
                        backgroundColor: const Color(0xffEFEFEF),
                        elevation: 0,
                        bottom: const TabBar(
                          labelColor: Colors.black,
                          unselectedLabelColor: Color(0xff6C6C6C),
                          indicatorColor: Colors.black,
                          indicator: UnderlineTabIndicator(
                              borderSide: BorderSide(width: 4.0),
                              insets: EdgeInsets.symmetric(horizontal: 16.0)),
                          tabs: [
                            Tab(
                              text: '10% Off',
                            ),
                            Tab(
                              text: '15% Off',
                            ),
                            Tab(
                              text: '20% Off',
                            ),
                            Tab(
                              text: '25% Off',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TabBarView(
                        children: [
                          // _babyCare(),
                          // Icon(Icons.directions_transit),
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: 38.h,
                            width: 100.w,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, _) => SizedBox(
                                      height: 1.h,
                                    ),
                                itemCount: categoryItem.length,
                                itemBuilder: (context, index) {
                                  CategoryItem productList =
                                      categoryItem[index];
                                  return _listOfProduct4(productList);
                                }),
                          ),
                          const Icon(Icons.directions_transit),
                          const Icon(Icons.directions_bike),
                          const Icon(Icons.directions_bike),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    )
                  ]),
                ),
                Container(
                  padding: const EdgeInsets.all(14),
                  height: 49.5.h,
                  width: 100.h,
                  color: Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Recommended Items",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            CarouselSlider(
                              carouselController: carouselController,
                              options: CarouselOptions(
                                height: 42.h,
                                viewportFraction: 1.0,
                                enlargeCenterPage: false,
                                // autoPlay: false,
                              ),
                              items: item
                                  .map((i) => Container(
                                        child: Column(
                                          children: [
                                            Center(
                                              child: ImageHelper(
                                                image: i,
                                                imageType: ImageType.asset,
                                                height: 32.h,
                                                width: 100.w,
                                                boxFit: BoxFit.fill,
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(16),
                                              height: 10.h,
                                              width: 100.w,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 68.w,
                                                    child: Text(
                                                      "Tassimo Cadbury Hot Chocolate Tdiscs 8 Servings - Pack of 5",
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        "35%off",
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 11.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                      SizedBox(
                                                        height: 0.6.h,
                                                      ),
                                                      Text(
                                                        "£18.44",
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                            Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          carouselController.previousPage();
                                        },
                                        child: const CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Colors.white,
                                          child: Icon(
                                            Icons.arrow_back_sharp,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        onTap: () {
                                          carouselController.nextPage();
                                        },
                                        child: const CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 15,
                                            child: Icon(
                                              Icons.arrow_forward_sharp,
                                              color: Colors.black,
                                              size: 20,
                                            )),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),

                        // SizedBox(
                        //   height: 1.h,
                        // ),
                      ]),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  color: const Color(0xffFFF2EA),
                  height: 28.h,
                  width: 100.w,
                  child: SizedBox(
                    height: 30.h,
                    width: 100.w,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, _) => SizedBox(
                              width: 1.2.h,
                            ),
                        itemCount: categoryItem.length,
                        itemBuilder: (context, index) {
                          CategoryItem productList = categoryItem[index];
                          return _listOfProduct5(productList);
                        }),
                  ),
                ),
                const SizedBox(
                  height: 400,
                )
              ],
            ),
          )),
    );
  }

  Widget _listOfProduct(CategoryItem items) => Container(
        color: Colors.black,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              // padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(left: 5.w),
              height: 17.h,
              width: 34.w,
              child: ImageHelper(
                image: items.productImg,
                height: 12.h,
                width: 24.w,
                imageType: ImageType.asset,
              ),
            ),
            SizedBox(
              width: 29.w,
              child: const Text("Deals of the Day",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white)),
            ),
            SizedBox(
              width: 29.w,
              child: Text("From £18.44 ",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white, fontSize: 8.sp)),
            ),
          ],
        ),
      );

  Widget _listOfProduct2(CategoryItem items) => Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      // color: Colors.black,
                      // padding: EdgeInsets.all(15),
                      // margin: EdgeInsets.all(8),
                      height: 24.h,
                      width: 38.w,
                      child: ImageHelper(
                        image: items.productImg,
                        // height: 32.h,
                        // width: 24.w,
                        imageType: ImageType.asset,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                    width: 28.w,
                    child: const Expanded(
                      child: Text(
                          "Nescafe gold Cappuccino Coffee 8 Sachets X 15.5g",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black)),
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        const Text("£18.44",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            )),
                        SizedBox(
                          width: 2.w,
                        ),
                        const Text("£2.94",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xff888888),
                            )),
                        SizedBox(
                          width: 2.w,
                        ),
                        const Text("20% OFF",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.red,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                  right: 0,
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
                  ))
            ],
          ),
        ),
      );

  Widget _listOfProduct3(CategoryItem items) => Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Center(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(12),
                  // margin: EdgeInsets.all(8),
                  height: 21.h,
                  width: 40.w,
                  child: ImageHelper(
                    image: items.productImg,
                    // height: 32.h,
                    // width: 24.w,
                    imageType: ImageType.asset,
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text("Coffee & Tea",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  )),
              const Text("Beverages",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.red,
                  )),
            ],
          ),
          Positioned(
            top: 10,
            child: ImageHelper(
              image: "assets/images/offIcon.png",
              imageType: ImageType.asset,
              // height: 10.h,
              width: 30.w,
              // boxFit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: 10,
            top: 15,
            child: Row(
              children: [
                ImageHelper(
                  image: "assets/images/star.png",
                  imageType: ImageType.asset,
                  height: 2.2.h,
                  width: 3.w,
                ),
                Text("  GET 50% OFF",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 8.sp,
                      color: Colors.black,
                    )),
              ],
            ),
          ),
        ],
      );

  Widget _listOfProduct4(CategoryItem items) => Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      // color: Colors.black,
                      // padding: EdgeInsets.all(15),
                      // margin: EdgeInsets.all(8),
                      height: 24.h,
                      width: 38.w,
                      child: ImageHelper(
                        image: items.productImg,
                        // height: 32.h,
                        // width: 24.w,
                        imageType: ImageType.asset,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                    width: 28.w,
                    child: Expanded(
                      child: Text(
                          "Nescafe gold Cappuccino Coffee 8 Sachets X 15.5g",
                          textAlign: TextAlign.left,
                          maxLines: 3,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        const Text("£18.44",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            )),
                        SizedBox(
                          width: 2.w,
                        ),
                        const Text("£2.94",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xff888888),
                            )),
                        SizedBox(
                          width: 2.w,
                        ),
                        const Text("20% OFF",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.red,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                  right: 0,
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
                  ))
            ],
          ),
        ),
      );

  Widget _listOfProduct5(CategoryItem items) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(12),
              height: 20.h,
              width: 40.w,
              child: ImageHelper(
                image: items.productImg,
                imageType: ImageType.asset,
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          SizedBox(
            width: 39.w,
            child: Row(
              children: [
                Text("Coffee & Tea",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    )),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward,
                  size: 18,
                )
              ],
            ),
          ),
        ],
      );
}
