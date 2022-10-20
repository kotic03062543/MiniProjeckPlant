import 'package:get/get.dart';
import 'package:myfirstapp/until/app_constants.dart';

import '../api/api_client.dart';

class PoppolarProRepo extends GetxService {
  final ApiClient apiClient;

  PoppolarProRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getDatapop(AppConstants.POPULAR_PRODUCT_URI );

  }
}
