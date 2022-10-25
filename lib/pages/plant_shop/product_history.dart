// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myfirstapp/widgets/mediam_text.dart';
import 'package:unicons/unicons.dart';
// import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../until/colors.dart';
import '../../until/dimension.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';

class ProductHis extends StatefulWidget {
  final String user_id;
  ProductHis({Key? key, required this.user_id}) : super(key: key);

  @override
  State<ProductHis> createState() => _ProductHisState();
}

class _ProductHisState extends State<ProductHis> {
  Future showorders() async {
    var url = Uri.parse(
        'https://plantyshop.vitinias.com/connectPHP/showorder_history.php');
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
                GestureDetector(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (builder) {
                    //   return ProductHis();
                    // }));
                  },
                  child: AppIcon(
                    icon: UniconsLine.history,
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
                                  height: Dimensions.height20 * 4.5,
                                  child: Row(
                                    children: [
                                      SizedBox(width: Dimensions.width20),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.grey,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                          height: Dimensions.height20 * 4,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              MediamText(
                                                  text: list[index]
                                                      ['product_name'],
                                                  color: Colors.black54),
                                              // SmallText(text: 'Type plant'),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  MediamText(
                                                      text: '฿ ' +
                                                          list[index]
                                                              ['product_price'],
                                                      color:
                                                          AppColors.lightRed),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        var url = Uri.parse(
                                                            "https://plantyshop.vitinias.com/connectPHP/delete_history.php");
                                                        http.post(url, body: {
                                                          'detail_id':
                                                              list[index]
                                                                  ['detail_id'],
                                                        });
                                                      });
                                                      debugPrint(
                                                          'delete Clicked');
                                                      RefreshIndicator;
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
    );
  }
}
