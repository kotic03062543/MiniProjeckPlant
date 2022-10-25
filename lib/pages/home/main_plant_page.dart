// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:myfirstapp/until/colors.dart';
import 'package:myfirstapp/widgets/big_text.dart';
import 'package:myfirstapp/widgets/small_text.dart';
import 'package:unicons/unicons.dart';

import 'catagories.dart';
import 'plant_page_body.dart';

import '../../model/login_model.dart';

class MainPlantPage extends StatefulWidget {
  static const routeName = '/';
  final String user_id;
  // final String id01;

  MainPlantPage({
    Key? key,
    required this.user_id,
  }) : super(key: key);

  @override
  State<MainPlantPage> createState() => _MainPlantPageState();
}

class _MainPlantPageState extends State<MainPlantPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmember();
    // print('User : ${widget.id01}');
  }
  // List<ModelUserMember> memberlist = [];

  Future getmember() async {
    var url =
        Uri.parse('https://plantyshop.vitinias.com/connectPHP/select.php');
    var response1 = await http.post(url, body: {
      // 'user_id': widget.id01,
    });
    var data = jsonDecode(response1.body);
    // print(data);
    // String user_id = data[0]['user_id'].toString();
  }

  @override
  Widget build(BuildContext context) {
    // print('screen = ' + MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body: Column(
        children: [
          //header
          Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.only(top: 70, bottom: 15),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Image.asset(
                          'images/logo2.png',
                          scale: 2.2,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      child: Icon(
                        UniconsLine.search,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.maincolor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //body slide
          Expanded(
            child: SingleChildScrollView(
              child: PlantPageBody(user_id: widget.user_id),
            ),
          ),
          //catagories
        ],
      ),
    );
  }
}
