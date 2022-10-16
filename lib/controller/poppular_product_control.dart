import 'package:get/get.dart';

import '../data/repository/popular_product.repo.dart';
import '../model/product_model.dart';

class PoppularProControl extends GetxController {
  final PoppolarProRepo poppolarProRepo;
  PoppularProControl({required this.poppolarProRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getPopularProductList() async {
    Response response = await poppolarProRepo.getPopularProductList();
    if (response.statusCode == 200) {
      // print('got products');
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      // print(_popularProductList);
      _isLoading=true;
      update();
    } else {}
  }
}
