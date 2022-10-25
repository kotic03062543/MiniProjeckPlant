// ignore_for_file: prefer_const_constructors, equal_keys_in_map, prefer_interpolation_to_compose_strings, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfirstapp/until/colors.dart';
import 'package:myfirstapp/until/dimension.dart';
import 'package:myfirstapp/widgets/app_icon.dart';
import 'package:myfirstapp/widgets/big_text.dart';
import 'package:myfirstapp/widgets/small_text.dart';
import 'package:unicons/unicons.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../plant_shop/recommended_plant.dart';
import '../bottom_bar/home.dart';

class Other extends StatefulWidget {
  final String user_id;
  const Other({
    Key? key,
    required this.user_id,
  }) : super(key: key);

  @override
  State<Other> createState() => _OtherState();
}

class _OtherState extends State<Other> {
  Future showorders() async {
    var url =
        Uri.parse('https://plantyshop.vitinias.com/connectPHP/other.php');
    var response = await http.post(url, body: {
      'user_id': widget.user_id,
    });
    var data = jsonDecode(response.body);
    // print(data);
    return json.decode(response.body);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height20 * 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: AppIcon(
                    icon: UniconsLine.angle_left_b,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.maincolor,
                    size: 45,
                  ),
                ),
                SizedBox(width: Dimensions.width20 * 7),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) {
                      return Launcher(
                        user_id: '',
                      );
                    }));
                  },
                  child: AppIcon(
                    icon: UniconsLine.estate,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.maincolor,
                    size: 45,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) {
                      return Launcher(
                        user_id: '',
                      );
                    }));
                  },
                  child: AppIcon(
                    icon: UniconsLine.shopping_cart,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.maincolor,
                    size: 45,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height20 * 10,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height10),
              // color: Colors.amber,
              child: MediaQuery.removeViewPadding(
                context: context,
                removeTop: true,
                child: RefreshIndicator(
                  onRefresh: () {
                    return Future.delayed(
                      Duration(seconds: 2),
                      () {
                        setState(() {});
                      },
                    );
                  },
                  child: FutureBuilder(
                    future: showorders(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) print(snapshot.error);
                      return snapshot.hasData
                          ? ListView.builder(
                              // shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                List list = snapshot.data;
                                return SizedBox(
                                  width: double.maxFinite,
                                  height: Dimensions.height20 * 10,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        RecomPlant(
                                          user_id: widget.user_id,
                                          product: list,
                                          index: index,
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          width: Dimensions.width20 * 7,
                                          height: Dimensions.height20 * 12,
                                          margin: EdgeInsets.only(bottom: 10),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage('images/' +
                                                  list[index]['product_pic']),
                                            ),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        SizedBox(width: Dimensions.width20),
                                        Expanded(
                                          child: Container(
                                            height: Dimensions.height20 * 10,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                BigText(
                                                    text: list[index]
                                                        ['product_name'],
                                                    color: Colors.black54),
                                                SmallText(text: 'Other'),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    BigText(
                                                        text: '฿ ' +
                                                            list[index][
                                                                'product_price'],
                                                        color:
                                                            AppColors.lightRed),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 15,
                                                          bottom: 15,
                                                          right: 20,
                                                          left: 20),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          color: Colors.white),
                                                      // child: Row(
                                                      //   // ignore: prefer_const_literals_to_create_immutables
                                                      //   children: [
                                                      //     Icon(UniconsLine.minus,
                                                      //         color:
                                                      //             Colors.black54),
                                                      //     SizedBox(width: 5),
                                                      //     BigText(text: '1'),
                                                      //     SizedBox(width: 5),
                                                      //     Icon(UniconsLine.plus,
                                                      //         color:
                                                      //             Colors.black54),
                                                      //   ],
                                                      // ),
                                                    ),
                                                    // GestureDetector(
                                                    //   onTap: () {
                                                    //     setState(() {
                                                    //       var url = Uri.parse(
                                                    //           "https://plantyshop.vitinias.com/connectPHP/deletecart.php");
                                                    //       http.post(url, body: {
                                                    //         'order_id':
                                                    //             list[index]
                                                    //                 ['order_id'],
                                                    //       });
                                                    //     });
                                                    //     debugPrint(
                                                    //         'delete Clicked');
                                                    //   },
                                                    //   child: Icon(
                                                    //       UniconsLine.trash_alt,
                                                    //       color: Colors.black54),
                                                    // ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          : Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Column(
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     Container(
      //       height: 120,
      //       padding: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
      //       decoration: BoxDecoration(
      //         color: AppColors.greycolor,
      //         borderRadius: BorderRadius.only(
      //             topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      //       ),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Container(
      //             padding:
      //                 EdgeInsets.only(top: 10, bottom: 15, right: 20, left: 20),
      //             decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(20),
      //                 color: Colors.white),
      //             child: BigText(
      //                 text: 'Total' + ' ฿120', color: AppColors.lightRed),
      //           ),
      //           Container(
      //             padding:
      //                 EdgeInsets.only(top: 15, bottom: 15, right: 20, left: 20),
      //             decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(20),
      //                 color: AppColors.maincolor),
      //             child: BigText(
      //               text: 'Checkout',
      //               // text: '฿${product_price.text} | Add',
      //               color: Colors.white,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
