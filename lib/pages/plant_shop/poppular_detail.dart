// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, non_constant_identifier_names, sort_child_properties_last, avoid_print, unused_local_variable

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfirstapp/controller/poppular_product_control.dart';
import 'package:myfirstapp/until/dimension.dart';
import 'package:myfirstapp/widgets/app_icon.dart';
import 'package:myfirstapp/widgets/mediam_text.dart';
import 'package:unicons/unicons.dart';
import '../../until/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

import 'cart_page.dart';

class PopularPlantDetail extends StatefulWidget {
  final List product;
  final int index;
  final String user_id;
  PopularPlantDetail(
      {Key? key,
      required this.product,
      required this.index,
      required this.user_id})
      : super(key: key);

  @override
  State<PopularPlantDetail> createState() => _PopularPlantDetailState();
}

class _PopularPlantDetailState extends State<PopularPlantDetail> {
  TextEditingController product_id = TextEditingController();
  TextEditingController product_name = TextEditingController();
  TextEditingController product_detail = TextEditingController();
  TextEditingController product_water = TextEditingController();
  TextEditingController product_light = TextEditingController();
  TextEditingController product_fer = TextEditingController();
  TextEditingController product_pic = TextEditingController();
  TextEditingController product_price = TextEditingController();
  TextEditingController product_star = TextEditingController();

  @override
  void initState() {
    super.initState();
    product_id.text = widget.product[widget.index]['product_id'];
    product_name.text = widget.product[widget.index]['product_name'];
    product_detail.text = widget.product[widget.index]['product_detail'];
    product_water.text = widget.product[widget.index]['product_water'];
    product_light.text = widget.product[widget.index]['product_light'];
    product_fer.text = widget.product[widget.index]['product_fer'];
    product_pic.text = widget.product[widget.index]['product_pic'];
    product_price.text = widget.product[widget.index]['product_price'];
    product_star.text = widget.product[widget.index]['product_star'];

    print('product' + product_id.text);
    // addorder();
    print('User' + widget.user_id);
    // getmember();
    // addorder();
  }

  // Future getmember() async {
  //   var url =
  //       Uri.parse('https://plantyshop.vitinias.com/connectPHP/select.php');
  //   var response1 = await http.post(url, body: {
  //     'user_id': widget.user_id,
  //   });
  //   var data = jsonDecode(response1.body);
  //   // print(data);
  // }

  //////////////////////////////////////////////
  Future addorder() async {
    var url1 = Uri.parse(
        'https://plantyshop.vitinias.com/connectPHP/addproductorder.php');
    var response1 = await http.post(url1, body: {
      'user_id': widget.user_id,
      'product_id': product_id.text,
    });
    var addorder = jsonDecode(response1.body);
    if (addorder == 'success') {
      print('success');
    } else {
      print('fail');
    }
  }

  @override
  Widget build(BuildContext context) {
    Get.find<PoppularProControl>().initProduct();
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
                  image: AssetImage('images/' + product_pic.text),
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
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: AppIcon(icon: UniconsLine.angle_left_b),
                  iconSize: 50,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartPage(user_id: widget.user_id),
                      ),
                    );
                  },
                  icon: AppIcon(icon: UniconsLine.shopping_cart),
                  iconSize: 50,
                ),
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
                  BigText(
                    text: product_name.text,
                    size: 30,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) {
                              return Icon(
                                Icons.star,
                                color: AppColors.maincolor,
                                size: 15,
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.width15,
                        ),
                        SmallText(text: product_star.text),
                      ],
                    ),
                  ),
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
                  //
                  SizedBox(height: Dimensions.height20 * 1.5),
                  BigText(text: 'Details', color: Colors.black54),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  //detail
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          MediamText(text: product_detail.text),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //expandable text
        ],
      ),
      /////////////////// bottom bar

      bottomNavigationBar: GetBuilder<PoppularProControl>(
        builder: (poppularProduct) {
          return Container(
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
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      GestureDetector(
                          onTap: () {
                            poppularProduct.setQuantity(false);
                          },
                          child:
                              Icon(UniconsLine.minus, color: Colors.black54)),
                      SizedBox(width: 5),
                      BigText(text: poppularProduct.quantity.toString()),
                      SizedBox(width: 5),
                      GestureDetector(
                          onTap: () {
                            poppularProduct.setQuantity(true);
                          },
                          child: Icon(UniconsLine.plus, color: Colors.black54)),
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 15, right: 20, left: 20),
                  child: GestureDetector(
                    onTap: () {
                      addorder();
                      Get.snackbar('Add Item to cart',
                          'Add ' + product_name.text + ' To cart Successfully',
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.white,
                          colorText: Colors.black,
                          icon: Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ));
                    },
                    child: BigText(
                      text: '฿ ' + product_price.text + ' | Add',
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.maincolor),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
