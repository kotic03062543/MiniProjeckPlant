// ignore_for_file: prefer_const_constructors, import_of_legacy_library_into_null_safe, non_constant_identifier_names, avoid_print
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:myfirstapp/until/colors.dart';
import '../../../model/login_model.dart';
import '../main_plant_page.dart';
import 'favorite.dart';
import 'profile.dart';
import 'shopping_cart.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class Launcher extends StatefulWidget {
  static const routeName = '/';
  String id;

  Launcher({Key? key, required this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LauncherState();
  }
}

class _LauncherState extends State<Launcher> {
  @override
  void initState() {
    super.initState();
    getmember();
    // print('hometest : ${widget.id}');
  }

  Future getmember() async {
    var url =
        Uri.parse('https://plantyshop.vitinias.com/connectPHP/select.php');
    var response1 = await http.post(url, body: {
      'user_id': widget.id,
    });
    var data = jsonDecode(response1.body);
    print(data);
    String user_id = data[0]['user_id'].toString();
  
}
  // static get data => data;

  int _selectedIndex = 0;
  final List _pageWidget = [
    MainPlantPage(),
    PoppuLar(),
    ShopCart(),
    ProFile(),
  ];

  final List<BottomNavigationBarItem> _menuBar = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(UniconsLine.estate),
      label: 'Home',
      backgroundColor: AppColors.whiteColor,
    ),
    BottomNavigationBarItem(
      icon: Icon(UniconsLine.heart),
      label: 'Favorite',
      backgroundColor: AppColors.whiteColor,
    ),
    BottomNavigationBarItem(
      icon: Icon(UniconsLine.shopping_cart),
      label: 'Cart',
      backgroundColor: AppColors.whiteColor,
    ),
    BottomNavigationBarItem(
      icon: Icon(UniconsLine.user),
      label: 'ProFile',
      backgroundColor: AppColors.whiteColor,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidget.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: _menuBar,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.maincolor,
        unselectedItemColor: AppColors.iconColor0,
        onTap: _onItemTapped,
      ),
    );
  }
}
