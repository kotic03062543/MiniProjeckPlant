// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:myfirstapp/until/colors.dart';

import '../main_plant_page.dart';
import 'favorite.dart';
import 'profile.dart';
import 'shopping_cart.dart';

class Launcher extends StatefulWidget {
  final String user_id;

  const Launcher({Key? key, required this.user_id}) : super(key: key);

  @override
  State<Launcher> createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
  @override
  int pageIndex = 0;

  void initState() {
    super.initState();
    // print('Test' + widget.user_id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }
  //Body
  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        MainPlantPage(user_id: widget.user_id),
        FavoreitPage(user_id: widget.user_id),
        ShopCart(user_id: widget.user_id),
        ProFile(user_id: widget.user_id),
      ],
    );
  }

  //FOOTER
  Widget getFooter() {
    List items = [
      "images/user.png",
      "images/heart.png",
      "images/shop.png",
      "images/pro.png",
    ];
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 60,
      decoration: BoxDecoration(color: AppColors.whiteColor, boxShadow: [
        BoxShadow(
            color: const Color(0Xff000000).withOpacity(0.12),
            blurRadius: 5,
            offset: const Offset(0, -3)),
      ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 7),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(items.length, (index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    pageIndex = index;
                  });
                },
                child: Column(
                  children: [
                    Image.asset(
                      items[index],
                      width: 40,
                      height: 40,
                    ),
                    pageIndex == index
                        ? AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            child: Container(
                              height: 6,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: AppColors.maincolor,
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                          )
                        : Container()
                  ],
                ),
              );
            })),
      ),
    );
  }
}
