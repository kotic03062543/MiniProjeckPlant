// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double ScreenWidth = Get.context!.width;

  //821
  // 3.84 7.03
  static double pageViewContainer = screenHeight / 3.84;
  static double pageView = screenHeight / 2.64;
  static double pageViewTextContainer = screenHeight / 7.03;

  static double height10 = screenHeight / 100.4;
  static double height15 = screenHeight / 72.27;
  static double height20 = screenHeight / 60.2;

  static double font24 = screenHeight / 60.2;
  static double font26 = screenHeight / 32.2;

  static double width10 = ScreenWidth / 72.27;
  static double width15 = ScreenWidth / 42.2;
  static double width20 = ScreenWidth / 22.05;

  static double radian20 = screenHeight / 40.05;
  static double radian15 = screenHeight / 60.2;

  static double ListViewImgSize = ScreenWidth / 3.25;
  static double ListViewTextCountImgSize = ScreenWidth / 3.9;
}
