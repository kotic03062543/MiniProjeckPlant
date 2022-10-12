// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/until/colors.dart';
import 'package:myfirstapp/until/dimension.dart';
import 'package:myfirstapp/widgets/app_column.dart';
import 'package:myfirstapp/widgets/big_text.dart';
import 'package:myfirstapp/widgets/icon_and_text_widget.dart';
import 'package:myfirstapp/widgets/small_text.dart';
import 'package:unicons/unicons.dart';

import '../../model/login_model.dart';

class PlantPageBody extends StatefulWidget {
  PlantPageBody({Key? key}) : super(key: key);

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

  List<ModelProducts> pruductlist = [];

  Future getdata() async {
    // var url = "http://localhost/addressbook/select.php";
    var url = Uri.parse("https://plantyshop.vitinias.com/connectPHP/select_product.php");
    var response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slide menu
        Container(
          // color: Colors.redAccent,
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
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
        //Poppular menu
        SizedBox(height: Dimensions.height15),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Recomment'),
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
                margin: EdgeInsets.only(bottom: 3),
                child: SmallText(
                  text: 'Plant paring',
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
        //listview menu
        FutureBuilder(
          future: getdata(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) print(snapshot.error);
            return snapshot.hasData
                ? ListView.builder(
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
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radian20),
                                color: Colors.white38,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('images/${list[index]['product_pic']}'),
                                ),
                              ),
                            ),
                            //text menu
                            Expanded(
                              child: Container(
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      BigText(text: list[index]['product_name']),
                                      SizedBox(height: Dimensions.height10),
                                      SmallText(
                                          text:
                                              list[index]['product_detail']),
                                      SizedBox(height: Dimensions.height10),
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
                                            text: list[index]['product_price'],
                                            iconColor: AppColors.iconColor2,
                                          ),
                                          IconAndTextWidget(
                                            icon: UniconsLine.telegram,
                                            text: list[index]['product_amount'],
                                            iconColor: AppColors.iconColor3,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : Text('');
          },
        ),
      ],
    );
  }

  //////////// menu slide pageview
  Widget _buildPageItem(int index) {
    //up and down
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2; //1/10*220=22
      //เข้ากลาง
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
      //
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
      //
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
      //ทำให้ slide smooth
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'images/todd.jpg',
                ),
              ),
            ),
          ),
          //อันที่ซ้อนกัน
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
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
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: AppColumn(
                  text: 'Castus Malai',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
