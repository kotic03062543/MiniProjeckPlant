// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myfirstapp/pages/home/catagorymenu/indoor.dart';
import 'package:myfirstapp/pages/home/catagorymenu/outdoor.dart';
import 'package:myfirstapp/until/colors.dart';
import 'package:unicons/unicons.dart';

import 'catagorymenu/office.dart';
import 'catagorymenu/others.dart';


class catagories extends StatefulWidget {
  final String user_id;
  catagories({Key? key, required this.user_id}) : super(key: key);

  @override
  State<catagories> createState() => _catagoriesState();
}

class _catagoriesState extends State<catagories> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Container(
        // width: 100,
        height: 70,
        margin: const EdgeInsets.only(left: 30, right: 15),
        // height: Dimensions.pageView,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return OutDoor(user_id: widget.user_id);
                }));
              },
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                width: 70,
                // height: 50,
                decoration: BoxDecoration(
                  color: AppColors.greencolorlow,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Icon(
                      UniconsLine.pagelines,
                      color: AppColors.maincolor,
                    ),
                    SizedBox(height: 10),
                    Text('Outdoor'),
                  ],
                ),
              ),
            ),
            //
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return InDoor(user_id: widget.user_id);
                }));
              },
              child: Container(
                margin: const EdgeInsets.only(right: 15),
                width: 70,
                // height: 50,
                decoration: BoxDecoration(
                  color: AppColors.greencolorlow,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Icon(
                      UniconsLine.flask_potion,
                      color: AppColors.iconColor3,
                    ),
                    SizedBox(height: 10),
                    Text('Indoor'),
                  ],
                ),
              ),
            ),
            //
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return OfFice(user_id: widget.user_id);
                }));
              },
              child: Container(
                margin: const EdgeInsets.only(right: 15),
                width: 70,
                // height: 50,
                decoration: BoxDecoration(
                  color: AppColors.greencolorlow,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Icon(
                      UniconsLine.home,
                      color: AppColors.iconColor2,
                    ),
                    SizedBox(height: 10),
                    Text('Offices'),
                  ],
                ),
              ),
            ),
            //
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Other(user_id: widget.user_id);
                }));
              },
              child: Container(
                margin: const EdgeInsets.only(right: 15),
                width: 70,
                // height: 50,
                decoration: BoxDecoration(
                  color: AppColors.greencolorlow,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Icon(
                      UniconsLine.cell,
                      color: Colors.blue,
                    ),
                    SizedBox(height: 10),
                    Text('Others'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
