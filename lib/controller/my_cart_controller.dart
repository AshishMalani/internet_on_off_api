import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/product_model.dart';

class MyCartController extends GetxController {
  List<ProductModel> myCartList = [];
  List<ProductModel> set = [];
  final data = GetStorage();

  bool isProductsExits(int productId) {
    bool result = false;

    for (var product in myCartList) {
      if (product.id == productId) {
        result = true;
        break;
      } else {
        result = false;
      }
    }

    print(result);
    return result;
  }

  void addProduct(ProductModel product) {
    myCartList.add(product);
    set = myCartList;
    data.write('Data', set);
    update();
  }

  void removeProduct(int productId) {
    for (var product in myCartList) {
      if (product.id == productId) {
        myCartList.remove(product);
        update();
        break;
      }
    }
  }
}
