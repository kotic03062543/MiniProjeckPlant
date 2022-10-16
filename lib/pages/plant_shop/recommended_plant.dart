// ignore_for_file: public_member_api_docs, sort_constructors_first, equal_keys_in_map, non_constant_identifier_names
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myfirstapp/pages/plant_shop/cart_page.dart';

import 'package:myfirstapp/until/colors.dart';
import 'package:myfirstapp/until/dimension.dart';
import 'package:myfirstapp/widgets/app_icon.dart';
import 'package:myfirstapp/widgets/big_text.dart';
// import 'package:myfirstapp/widgets/expandeble_text.dart';
import 'package:myfirstapp/widgets/mediam_text.dart';
// import 'package:myfirstapp/widgets/small_text.dart';
import 'package:unicons/unicons.dart';

import '../../widgets/small_text.dart';

import 'package:http/http.dart' as http;

class RecomPlant extends StatefulWidget {
  // final String product_id;
  final List product;
  final int index;

  RecomPlant({Key? key, required this.product, required this.index})
      : super(key: key);

  @override
  State<RecomPlant> createState() => _RecomPlantState();
}

class _RecomPlantState extends State<RecomPlant> {
  TextEditingController product_name = TextEditingController();
  TextEditingController product_detail = TextEditingController();
  TextEditingController product_water = TextEditingController();
  TextEditingController product_light = TextEditingController();
  TextEditingController product_fer = TextEditingController();
  TextEditingController product_pic = TextEditingController();
  TextEditingController product_price = TextEditingController();

  bool editMode = false;

  // Future RecomPlant() async {
  //   if (editMode) {
  //     // var url = 'https://pattyteacher.000webhostapp.com/edit.php';
  //     var url = Uri.parse(
  //         "https://plantyshop.vitinias.com/connectPHP/select_product.php");
      // await http.post(url, body: {
      //   'product_name': product_name.text,
      //   'product_detail': product_detail.text,
      //   'product_detail': product_water.text,
      //   'product_detail': product_light.text,
      //   'product_detail': product_fer.text,
      //   'product_pic': product_pic.text,
      //   'product_price': product_price.text,

      //   // 'password': password.text,
      // });
      // print(product_name.text);

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => Home(),
      //   ),
      // );
    // }
  // }
  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      // editMode = true;
      product_name.text = widget.product[widget.index]['product_name'];
      product_detail.text = widget.product[widget.index]['product_detail'];
      product_water.text = widget.product[widget.index]['product_water'];
      product_light.text = widget.product[widget.index]['product_light'];
      product_fer.text = widget.product[widget.index]['product_fer'];
      product_pic.text = widget.product[widget.index]['product_pic'];
      product_price.text = widget.product[widget.index]['product_price'];
      //  print('Name'+product_name.text);
    }
  }

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
              // mainAxisAlignment: MainAxisAlignment.end,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CartPage();
                    }));
                  },
                  child: (AppIcon(icon: UniconsLine.shopping_cart)),
                ),
                // AppIcon(icon: UniconsLine.times),
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
                  child:
                      BigText(size: Dimensions.font26, text: product_name.text),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.maincolorgreenme,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'images/${product_pic.text}',
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
                                text: product_water.text,
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
                                text: product_light.text,
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
                                text: product_fer.text,
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
                    text: product_detail.text,
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
                  text: '฿${product_price.text} x 0',
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
                    text: '฿${product_price.text} | Add',
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
