import 'package:get/get.dart';

import '../model/product_model.dart';
import '../service/get_Products.dart';

class HomeController extends GetxController {
  late List<ProductModel> products;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    setProductFromApi();
    super.onInit();
  }

  Future<void> setProductFromApi() async {
    products = await getProducts();
    isLoading.value = false;
  }
}
