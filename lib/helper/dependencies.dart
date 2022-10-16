import 'package:get/get.dart';
import 'package:myfirstapp/controller/poppular_product_control.dart';
import 'package:myfirstapp/data/repository/popular_product.repo.dart';
import 'package:myfirstapp/until/app_constants.dart';

import '../data/api/api_client.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  Get.lazyPut(() => PoppolarProRepo(apiClient: Get.find()));

  Get.lazyPut(() => PoppularProControl(poppolarProRepo: Get.find()));
}
