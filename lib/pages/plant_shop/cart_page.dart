// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfirstapp/until/colors.dart';
import 'package:myfirstapp/until/dimension.dart';
import 'package:myfirstapp/widgets/app_icon.dart';
import 'package:myfirstapp/widgets/big_text.dart';
import 'package:myfirstapp/widgets/small_text.dart';
import 'package:unicons/unicons.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

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
                AppIcon(
                  icon: UniconsLine.estate,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.maincolor,
                  size: 45,
                ),
                AppIcon(
                  icon: UniconsLine.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.maincolor,
                  size: 45,
                )
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
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (_, index) {
                    return Container(
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
                                image: AssetImage('images/todd.jpg'),
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          SizedBox(width: Dimensions.width20),
                          Expanded(
                            child: Container(
                              height: Dimensions.height20 * 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  BigText(
                                      text: 'Plant name',
                                      color: Colors.black54),
                                  SmallText(text: 'Type plant'),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigText(
                                          text: '฿ 120',
                                          color: AppColors.lightRed),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 15,
                                            bottom: 15,
                                            right: 20,
                                            left: 20),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white),
                                        child: Row(
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            Icon(UniconsLine.minus,
                                                color: Colors.black54),
                                            SizedBox(width: 5),
                                            BigText(text: '0'),
                                            SizedBox(width: 5),
                                            Icon(UniconsLine.plus,
                                                color: Colors.black54),
                                          ],
                                        ),
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
