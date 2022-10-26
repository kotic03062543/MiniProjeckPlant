// ignore_for_file: prefer_const_constructors, unnecessary_new, duplicate_ignore

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/until/colors.dart';
import 'package:myfirstapp/until/dimension.dart';
import 'package:myfirstapp/widgets/big_text.dart';
import 'package:myfirstapp/widgets/icon_and_text_widget.dart';
import 'package:myfirstapp/widgets/small_text.dart';
import 'package:unicons/unicons.dart';

import '../plant_shop/poppular_detail.dart';
import '../plant_shop/recommended_plant.dart';
import 'package:get/get.dart';

import 'catagories.dart';

class PlantPageBody extends StatefulWidget {
  final String user_id;

  PlantPageBody({Key? key, required this.user_id}) : super(key: key);

  @override
  State<PlantPageBody> createState() => _PlantPageBodyState();
}

class _PlantPageBodyState extends State<PlantPageBody> {
  //viewportFraction ทำให้มันย่อลงมาจะได้เห็นซ้ายขวา
  PageController pageController = PageController(viewportFraction: 0.85);
  //pop down ตอน silde
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  // double _height = 220;

  @override
  void dispost() {
    pageController.dispose();
  }

  //ให้รู้ว่าอยู่ index ไหน
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        // print('index' + _currPageValue.toString());
      });
    });
    // getdata();
  }
  //  Future getdata2() async {
  //   // var url = "http://localhost/addressbook/select.php";
  //   var url1 = Uri.parse(
  //       "https://plantyshop.vitinias.com/connectPHP/product_ratehight.php");
  //   var response1 = await http.get(url1);
  //   var data1 = jsonDecode(response1.body);
  //   // print(data);
  //   // return json.decode(response1.body);
  // }

  Future getdata() async {
    // var url = "http://localhost/addressbook/select.php";
    var url = Uri.parse(
        "https://plantyshop.vitinias.com/connectPHP/select_product.php");
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    // print(data);
    return json.decode(response.body);
  }

 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slide menu
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          height: Dimensions.pageView,
          child: FutureBuilder(
            future: getdata(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? PageView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        List list = snapshot.data;
                        return Stack(
                          children: [
                            Container(
                              height: Dimensions.pageViewContainer,
                              margin: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                // color: isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'images/' + list[index]['product_pic'],
                                  ),
                                ),
                              ),
                            ),
                            //อันที่ซ้อนกัน
                            GestureDetector(
                              onTap: () {
                                Get.to(() => PopularPlantDetail(
                                      user_id: widget.user_id,
                                      product: list,
                                      index: index,
                                    ));
                              },
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding:
                                      EdgeInsets.only(top: Dimensions.height15),
                                  height: Dimensions.pageViewTextContainer,
                                  margin: EdgeInsets.only(
                                      left: 30, right: 30, bottom: 30),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFFEDE4E0),
                                        blurRadius: 3.0,
                                        offset: Offset(3, 10),
                                      ),
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(-5, 0),
                                      ),
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(5, 0),
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 0, left: 15, right: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        BigText(
                                          text: list[index]['product_name'],
                                        ),
                                        // SizedBox(height: Dimensions.height10),
                                        Container(
                                          margin: EdgeInsets.only(left: 3),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Wrap(
                                                children: List.generate(
                                                  5,
                                                  (index) {
                                                    return Icon(
                                                      Icons.star,
                                                      color:
                                                          AppColors.maincolor,
                                                      size: 15,
                                                    );
                                                  },
                                                ),
                                              ),
                                              SizedBox(width: 3),
                                              SmallText(
                                                  text: list[index]
                                                      ['product_star']),
                                              SizedBox(width: 10),
                                              SmallText(text: '350'),
                                              SizedBox(width: 3),
                                              SmallText(text: 'comments'),
                                              SizedBox(
                                                  height: Dimensions.height10),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            height: Dimensions.height10 * 1.3),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconAndTextWidget(
                                              icon: Icons.circle_sharp,
                                              text: list[index]['type_name'],
                                              iconColor: AppColors.iconColor1,
                                            ),
                                            IconAndTextWidget(
                                              icon: UniconsLine.bitcoin,
                                              text: list[index]
                                                  ['product_price'],
                                              iconColor: AppColors.iconColor2,
                                            ),
                                            IconAndTextWidget(
                                              icon: UniconsLine.telegram,
                                              text: list[index]
                                                  ['product_amount'],
                                              iconColor: AppColors.iconColor3,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ),

        // ignore: unnecessary_new
        //dot
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.maincolor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        SizedBox(height: 20),
        //catagories
        catagories(user_id: widget.user_id),
        SizedBox(height: 10),
        //search bar
        // Container(
        //   margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        //   child: TextFormField(
        //     controller: textController,
        //     decoration: InputDecoration(
        //       hintText: 'Search',
        //       prefixIcon: Icon(Icons.search),
        //       border: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(20),
        //       ),
        //     ),
        //   ),
        // ),
        //Poppular menu
        SizedBox(height: Dimensions.height15),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Recommended'),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: '.',
                  color: Colors.black45,
                ),
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: EdgeInsets.only(bottom: 6),
                child: SmallText(
                  text: 'Plant Paring',
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),

        //listview recommended
        Container(
          margin: EdgeInsets.only(top: Dimensions.height10),
          child: FutureBuilder(
            future: getdata(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) print(snapshot.error);
              return snapshot.hasData
                  ? MediaQuery.removeViewPadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          List list = snapshot.data;
                          return Container(
                            margin: EdgeInsets.only(
                                left: Dimensions.width20,
                                right: Dimensions.width20,
                                bottom: Dimensions.height10),
                            child: Row(
                              children: [
                                //image menu
                                Container(
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radian20),
                                    color: Colors.white38,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'images/${list[index]['product_pic']}'),
                                    ),
                                  ),
                                ),
                                //text menu
                                Expanded(
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
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: Dimensions.width10 / 1.5),
                                      height: 110,
                                      // width: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                        ),
                                        color: AppColors.greencolorlow,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: Dimensions.width15,
                                          right: Dimensions.width20,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left:
                                                      Dimensions.width10 * 1.4),
                                              child: BigText(
                                                text: list[index]
                                                    ['product_name'],
                                              ),
                                            ),
                                            SizedBox(
                                                height:
                                                    Dimensions.height10 / 2),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left:
                                                      Dimensions.width10 * 1.5),
                                              child: SmallText(
                                                  text: list[index]
                                                      ['product_detail']),
                                            ),
                                            SizedBox(
                                                height: Dimensions.height10),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left:
                                                      Dimensions.width10 * 1.2),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  IconAndTextWidget(
                                                    icon: Icons.circle_sharp,
                                                    text: list[index]
                                                        ['type_name'],
                                                    iconColor:
                                                        AppColors.iconColor1,
                                                  ),
                                                  IconAndTextWidget(
                                                    icon: UniconsLine.bitcoin,
                                                    text: list[index]
                                                        ['product_price'],
                                                    iconColor:
                                                        AppColors.iconColor2,
                                                  ),
                                                  IconAndTextWidget(
                                                    icon: UniconsLine.telegram,
                                                    text: list[index]
                                                        ['product_amount'],
                                                    iconColor:
                                                        AppColors.iconColor3,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  : Center();
            },
          ),
        ),
      ],
    );
  }

  //////////// menu slide pageview
  // Widget _buildPageItem(int index) {
  //   //up and down
  //   Matrix4 matrix = new Matrix4.identity();
  //   if (index == _currPageValue.floor()) {
  //     var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
  //     var currTrans = _height * (1 - currScale) / 2; //1/10*220=22
  //     //เข้ากลาง
  //     matrix = Matrix4.diagonal3Values(1, currScale, 1)
  //       ..setTranslationRaw(0, currTrans, 0);
  //     //
  //   } else if (index == _currPageValue.floor() + 1) {
  //     var currScale =
  //         _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
  //     var currTrans = _height * (1 - currScale) / 2;
  //     matrix = Matrix4.diagonal3Values(1, currScale, 1);
  //     matrix = Matrix4.diagonal3Values(1, currScale, 1)
  //       ..setTranslationRaw(0, currTrans, 0);
  //     //
  //   } else if (index == _currPageValue.floor() - 1) {
  //     var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
  //     var currTrans = _height * (1 - currScale) / 2;
  //     matrix = Matrix4.diagonal3Values(1, currScale, 1);
  //     matrix = Matrix4.diagonal3Values(1, currScale, 1)
  //       ..setTranslationRaw(0, currTrans, 0);
  //     //ทำให้ slide smooth
  //   } else {
  //     var currScale = 0.8;
  //     matrix = Matrix4.diagonal3Values(1, currScale, 1)
  //       ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
  //   }

  // return Transform(
  //   transform: matrix,
  //   child:
  // );
}
