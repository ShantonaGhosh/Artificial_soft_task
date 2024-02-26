import 'package:artificial_soft_task/local_storage/cart_hive_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartController extends GetxController {
  Box<CartHiveModel> cartItemBox = Hive.box<CartHiveModel>('cartItem');
  var cartData = <CartHiveModel>[].obs;
  

  @override
  void onInit() {
    super.onInit();
    getCartList();
  }

  void getCartList() async {
    cartData.value = cartItemBox.values.toList();
  }
}
