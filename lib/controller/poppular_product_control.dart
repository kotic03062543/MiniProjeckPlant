import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfirstapp/controller/cart_controller.dart';
import 'package:myfirstapp/until/colors.dart';

import '../data/repository/popular_product.repo.dart';
import '../model/product_model.dart';

class PoppularProControl extends GetxController {
  final PoppolarProRepo poppolarProRepo;
  PoppularProControl({required this.poppolarProRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  // late CartController _cart;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int _quantity = 1;
  int get quantity => _quantity;
  // int _inCartItem = 0;
  // int get inCartItem => _inCartItem + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await poppolarProRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print('got products');
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      // print(_popularProductList);
      _isLoading = true;
      update();
    } else {}
  }

  void setQuantity(bool isInxrement) {
    if (isInxrement) {
      print(_quantity.toString());
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
      print(_quantity.toString());
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity < 1) {
      Get.snackbar(
        'Item count',
        'You can not add less than 1 item',
        backgroundColor: AppColors.maincolor,
        colorText: AppColors.whiteColor,
      );
      return 1;
    } else if (quantity > 10) {
      Get.snackbar(
        'Item count',
        'You can not add than more',
        backgroundColor: AppColors.yellowcolor,
        colorText: AppColors.mainblackcolor,
      );
      return 10;
    } else {
      return quantity;
    }
  }

  void initProduct() {
    _quantity = 1;
    // _inCartItem = 0;
    // _cart = cart;
  }

  // void addItem(ProductModel product) {
  //   _cart.addItem(product, _quantity);
  // }
}
