// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myfirstapp/until/dimension.dart';
import 'package:myfirstapp/widgets/app_column.dart';
import 'package:myfirstapp/widgets/app_icon.dart';
import 'package:myfirstapp/widgets/expandeble_text.dart';
import 'package:readmore/readmore.dart';
import 'package:unicons/unicons.dart';

import '../../until/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularPlantDetail extends StatelessWidget {
  const PopularPlantDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //backgroud img
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/todd.jpg'),
                ),
              ),
            ),
          ),
          //icon
          Positioned(
            top: 80,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                AppIcon(icon: UniconsLine.angle_left_b),
                AppIcon(icon: UniconsLine.shopping_cart),
              ],
            ),
          ),
          //introduc
          Positioned(
            left: 0,
            right: 0,
            top: 300,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: 'Castus Malai'),
                  SizedBox(height: Dimensions.height20),
                  //type overview
                  BigText(text: 'Overview', color: Colors.black54),
                  SizedBox(height: Dimensions.height20),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              UniconsLine.raindrops_alt,
                              color: AppColors.blueColor,
                            ),
                            SizedBox(width: Dimensions.width10 / 2),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SmallText(
                                  text: '250ml',
                                  color: AppColors.maincolor,
                                ),
                                SizedBox(
                                  height: Dimensions.height10 / 2.3,
                                ),
                                SmallText(text: 'WATER'),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              UniconsLine.brightness,
                              color: AppColors.iconColor3,
                            ),
                            SizedBox(width: Dimensions.width10 / 2),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SmallText(
                                  text: '35-40%',
                                  color: AppColors.maincolor,
                                ),
                                SizedBox(
                                  height: Dimensions.height10 / 2.3,
                                ),
                                SmallText(text: 'LIGHT'),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              UniconsLine.dialpad_alt,
                              color: AppColors.iconColor2,
                            ),
                            SizedBox(width: Dimensions.width10 / 2),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SmallText(
                                  text: '250gm',
                                  color: AppColors.maincolor,
                                ),
                                SizedBox(
                                  height: Dimensions.height10 / 2.3,
                                ),
                                SmallText(text: 'FERTILIZER'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //
                  SizedBox(height: Dimensions.height20),
                  BigText(text: 'Introduce', color: Colors.black54),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  //detail
                  Expanded(
                      child: SingleChildScrollView(
                          child: ExpandableText(
                              text:
                                  'It is a cactus in the family of mammillaries with fluffy white hairs covering its body, similar to cat hair. Therefore, this species of cactus was named a cats fur. And there will be sharp thorns with curved ends hidden under the hairs. In addition to having a cute face The flowers of the cats hair also look cute. The flowers are small, pink on top It is a cactus in the family of mammillaries with fluffy white hairs covering its body.')))
                ],
              ),
            ),
          ),
          //expandable text
        ],
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
        decoration: BoxDecoration(
          color: AppColors.greycolor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 15, bottom: 15, right: 20, left: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Icon(UniconsLine.minus, color: Colors.black54),
                  SizedBox(width: 5),
                  BigText(text: '0'),
                  SizedBox(width: 5),
                  Icon(UniconsLine.plus, color: Colors.black54),
                ],
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 15, bottom: 15, right: 20, left: 20),
              child: BigText(
                text: '\$10 | Add to cart',
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.maincolor),
            ),
          ],
        ),
      ),
    );
  }
}
