// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myfirstapp/until/colors.dart';
import 'package:myfirstapp/until/dimension.dart';
import 'package:myfirstapp/widgets/app_icon.dart';
import 'package:myfirstapp/widgets/big_text.dart';
// import 'package:myfirstapp/widgets/expandeble_text.dart';
import 'package:myfirstapp/widgets/mediam_text.dart';
// import 'package:myfirstapp/widgets/small_text.dart';
import 'package:unicons/unicons.dart';

import '../../widgets/small_text.dart';

class RecomPlant extends StatelessWidget {
  const RecomPlant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //เลื่อนขึ้นลงเท่ๆ แบบ sliver
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: UniconsLine.times),
                AppIcon(icon: UniconsLine.shopping_cart)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                // margin: EdgeInsets.only(left: 20,right: 20),

                width: double.infinity,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                // margin: EdgeInsets.only(left: 20,right: 20),

                child: Center(
                  child: BigText(size: Dimensions.font26, text: 'Castus Malai'),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.maincolor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'images/todd.jpg',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                //type overview
                SizedBox(height: Dimensions.height20 / 2),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.greycolor),
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width20,
                      vertical: Dimensions.width20 / 1.2),
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
                Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      top: Dimensions.width20),
                  child: MediamText(
                    text:
                        'It is a cactus in the family of mammillaries with fluffy white hairs covering its body, similar to cat hair. Therefore, this species of cactus was named a cats fur. And there will be sharp thorns with curved ends hidden under the hairs. In addition to having a cute face The flowers of the cats hair also look cute. The flowers are small, pink on top It is a cactus in the family of mammillaries with fluffy white hairs covering its body.It is a cactus in the family of mammillaries with fluffy white hairs covering its body, similar to cat hair. Therefore, this species of cactus was named a cats fur. And there will be sharp thorns with curved ends hidden under the hairs. In addition to having a cute face The flowers of the cats hair also look cute. The flowers are small, pink on top It is a cactus in the family of mammillaries with fluffy white hairs covering its bodyIt is a cactus in the family of mammillaries with fluffy white hairs covering its body, similar to cat hair. Therefore, this species of cactus was named a cats fur. And there will be sharp thorns with curved ends hidden under the hairs. In addition to having a cute face The flowers of the cats hair also look cute. The flowers are small, pink on top It is a cactus in the family of mammillaries with fluffy white hairs covering its body',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconColor: Colors.white,
                  backgroundColor: AppColors.maincolor,
                  icon: UniconsLine.minus,
                ),
                BigText(
                  text: '\$12.88' + ' x ' + '0',
                  color: AppColors.mainblackcolor,
                ),
                AppIcon(
                  iconColor: Colors.white,
                  backgroundColor: AppColors.maincolor,
                  icon: UniconsLine.plus,
                ),
              ],
            ),
          ),
          Container(
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
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Icon(
                    UniconsLine.heart_alt,
                    color: AppColors.maincolor,
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, right: 20, left: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.maincolor),
                  child: BigText(
                    text: '\$10 | Add',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
