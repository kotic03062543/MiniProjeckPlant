// ignore_for_file: prefer_const_constructors, equal_keys_in_map, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfirstapp/pages/home/main_plant_page.dart';
import 'package:myfirstapp/until/colors.dart';
import 'package:myfirstapp/until/dimension.dart';
import 'package:myfirstapp/widgets/app_icon.dart';
import 'package:myfirstapp/widgets/big_text.dart';
import 'package:myfirstapp/widgets/small_text.dart';
import 'package:unicons/unicons.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class FavoreitPage extends StatefulWidget {
  final String user_id;
  const FavoreitPage({
    Key? key,
    required this.user_id,
  }) : super(key: key);

  @override
  State<FavoreitPage> createState() => _FavoreitPageState();
}

class _FavoreitPageState extends State<FavoreitPage> {
  Future showorders() async {
    var url = Uri.parse(
        'https://plantyshop.vitinias.com/connectPHP/showfavorite.php');
    var response = await http.post(url, body: {
      'user_id': widget.user_id,
    });
    var data = jsonDecode(response.body);
    // print(data);
    return json.decode(response.body);
  }

  // Future showorders() async {
  //   var url =
  //       Uri.parse('https://plantyshop.vitinias.com/connectPHP/showorder.php');
  //   var response1 = await http.post(url, body: {
  //     // 'user_id': widget.user_id,
  //     // 'user_id': widget.prouct_id,
  //   });
  //   var data = jsonDecode(response1.body);
  //   print(data);
  // }

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
                    // Navigator.pop(context);
                  },
                  child: AppIcon(
                    icon: UniconsLine.angle_left_b,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.maincolor,
                    size: 45,
                  ),
                ),
                SizedBox(width: Dimensions.width20 * 7),
                AppIcon(
                  icon: UniconsLine.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.maincolor,
                  size: 45,
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
                                              // SmallText(text: list[index]['product_detail']),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  BigText(
                                                      text: '฿ ' +
                                                          list[index]
                                                              ['product_price'],
                                                      color:
                                                          AppColors.lightRed),
                                                 
                                                  
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        var url = Uri.parse(
                                                            "https://plantyshop.vitinias.com/connectPHP/deleteorder.php");
                                                        http.post(url, body: {
                                                          'fav_id': list[index]
                                                              ['fav_id'],
                                                          // 'user_id':widget.user_id,
                                                          // 'product_id':list[index]['product_id']
                                                        });
                                                      });

                                                      debugPrint(
                                                          'delete Clicked');
                                                       Get.snackbar(
                                                          'Delete Favorite',
                                                          'Delete '
                                                              ' To Favorite Successfully',
                                                          snackPosition:
                                                              SnackPosition.TOP,
                                                          backgroundColor:
                                                              Colors.white,
                                                          colorText:
                                                              Colors.black,
                                                          icon: Icon(
                                                            Icons.check_circle,
                                                            color: Colors.green,
                                                            size: 25,
                                                          ));
                                                    },
                                                    child: Icon(
                                                        UniconsLine.trash_alt,
                                                        color: Colors.black54),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
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
