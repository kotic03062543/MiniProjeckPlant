// ignore_for_file: prefer_const_constructors, unused_import
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfirstapp/controller/poppular_product_control.dart';
import 'package:myfirstapp/pages/home/bottom_bar/home.dart';
import 'package:myfirstapp/pages/home/bottom_bar/profile.dart';
import 'package:myfirstapp/pages/home/main_plant_page.dart';
import 'package:myfirstapp/pages/home/plant_page_body.dart';
import 'package:myfirstapp/pages/plant_shop/poppular_detail.dart';
import 'package:myfirstapp/pages/plant_shop/recommended_plant.dart';
import 'package:myfirstapp/profile/track_order.dart';
import 'package:myfirstapp/splash_screen.dart';
import 'login_register_home/getstarted.dart';
import 'login_register_home/login_regis.dart';
import 'pages/home/bottom_bar/user_profile.dart';
import 'pages/plant_shop/cart_page.dart';

import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PoppularProControl>().getPopularProductList();

    return GetMaterialApp(
      title: 'Mainpage',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,


      home: SplashScreen(),
      // home: TrackOrder(),
      // home: PopularPlantDetail(),
      // home: LoginRegis(),
      // home: CartPage(),
      // home: PopularPlantDetail(),
      // home: MainPlantPage(),
    );
  }
}
