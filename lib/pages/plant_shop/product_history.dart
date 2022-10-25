import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../until/colors.dart';
import '../../until/dimension.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class ProductHis extends StatefulWidget {
  final String order_id;
  ProductHis({Key? key, required this.order_id}) : super(key: key);

  @override
  State<ProductHis> createState() => _ProductHisState();
}

class _ProductHisState extends State<ProductHis> {
  get http => null;

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
                    // future: showorders(),
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
                                      // Container(
                                      //   width: Dimensions.width20 * 7,
                                      //   height: Dimensions.height20 * 12,
                                      //   margin:
                                      //       const EdgeInsets.only(bottom: 10),
                                      //   decoration: BoxDecoration(
                                      //     image: DecorationImage(
                                      //       fit: BoxFit.cover,
                                      //       image: AssetImage('images/' +
                                      //           list[index]['product_pic']),
                                      //     ),
                                      //     color: Colors.white,
                                      //     borderRadius:
                                      //         BorderRadius.circular(20),
                                      //   ),
                                      // ),
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
                                              // SmallText(text: 'Type plant'),
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
                                                            "https://plantyshop.vitinias.com/connectPHP/deletecart.php");
                                                        http.post(url, body: {
                                                          'order_id':
                                                              list[index]
                                                                  ['order_id'],
                                                        });
                                                      });
                                                      debugPrint(
                                                          'delete Clicked');
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
